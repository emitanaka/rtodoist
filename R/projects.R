#' Modify projects on the todoist list
#'
#' @param name a vector of strings specifyibng the name of the projects
#' @param id a vector of integers speciying project ids
#' @param new_name a vector of strings speciying the new name of the projects
#' @param parent_id the project id to nest under
#' @param token todosit API token
#' @name projects
NULL

#' @rdname projects
#' @export
proj_get_all <- function(token = use_token()) {
    projs_df <- httr::GET(url = projects_api_url,
                         header_get(token = token)) %>%
        httr::content("text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(flatten = TRUE) %>%
        dplyr::mutate_if(is.factor, as.character) %>%
        dplyr::bind_rows(empty_project_df, .)
    projs_df
}

#' @rdname projects
#' @export
proj_get <- function(name = NULL, id = NULL, token = use_token()) {
    if(is.null(name) & is.null(id)) stop("A project name or id must be supplied.")
    projs_df <- proj_get_all(token = token)
    out_df <- dplyr::filter(projs_df, .data$id %in% .env$id | .data$name %in% .env$name)
    if(nrow(out_df)==0) stop(paste("There are no projects", ui_projects(name, id = id)))
    out_df
}

#' @rdname projects
#' @export
proj_get_by_id <- function(id, token = use_token()) {
    purrr::map_dfr(id, ~{
        httr::GET(url = paste0(projects_api_url, "/", .x),
                  header_get(token = token)) %>%
            httr::content("text", encoding = "UTF-8") %>%
            jsonlite::fromJSON() %>% # hmm not happy with return object here
            as.data.frame() %>%
            dplyr::mutate_if(is.factor, as.character) %>%
            dplyr::bind_rows(empty_project_df, .)
    })
}

#' @rdname projects
#' @export
proj_add <- function(name, parent_id = NULL, token = use_token()) {
    current_projects <- proj_get_all(token = token)
    if (name %in% current_projects$name) {
        stop("Project already exists")
    } else {
        if(interactive()) {

        }
        new_project <- proj_add_quick(name, patent_id, token)
        return(invisible(new_project))
    }
}

#' @rdname projects
#' @export
proj_add_quick <- function(name, parent_id = NULL, token = use_token()) {
    new_project <- httr::POST(url = projects_api_url,
                            header_post(token = token),
                            body = list(name   = name,
                                        parent = parent_id),
                            encode = "json")
    invisible(new_project)
}


#' @rdname projects
#' @export
proj_update_by_name <- function(name, new_name, token = use_token()) {
    id <- proj_get_all(token = token) %>%
        dplyr::filter(.data$name %in% .env$name) %>%
        dplyr::pull(id)
    proj_update_by_id(id, new_name, token)
}

#' @rdname projects
#' @export
proj_update_by_id <- function(id, new_name, token = use_token()) {
    purrr::walk2(id, new_name,
                 ~httr::POST(url = paste0(projects_api_url, "/", .x),
                      header_post(token = token),
                      body = list(name = .y), encode = "json")
                 )
}


#' @rdname projects
#' @export
proj_delete <- function(name = NULL, id = NULL, token = use_token(), prompt = TRUE) {
    if(is.null(name) & is.null(id)) stop("A project name or id must be supplied.")

    projs_df <- proj_get_all(token = token) %>%
        dplyr::filter(.data$name %in% .env$name | .data$id %in% .env$id)

    if (!nrow(projs_df)) {
        stop("Project not found.")
    } else {
        if(any(tt <- table(projs_df$name) > 1)) {
            dup_projects <- names(tt)[tt]
            warning("There are multiple projects with the names ",
                    ui_projects(dup_projects), ".")
            if(prompt) {
                proceed <- yesno("Are you you want to proceed?")
                if(!proceed) stop("Projects not deleted due to multiple projects with the same names.")
            }
        }

        delete_for_real <- ifelse(prompt,
                                  yesno("Are you sure you want to delete the project ",
                                        ui_projects(projs_df$name), "?"),
                                  TRUE)
        if (delete_for_real) {
            proj_delete_by_id(projs_df$id, token)
            if(length(projs_df$id) == 1) {
                message("Project ", ui_projects(projs_df$name, projs_df$id),
                        " was deleted.")
            } else {
                message("Projects ", ui_projects(projs_df$name, projs_df$id),
                        " were deleted.")
            }
        } else {
            message("Project deletion cancelled.")
        }
    }
}

#' @rdname projects
#' @export
proj_delete_by_id <- function(id, token = use_token()) {
    purrr::walk(id, ~{
        url <- paste0(projects_api_url, "/", .x)
        httr::DELETE(url = url, header_get(token = token))
    })
}

