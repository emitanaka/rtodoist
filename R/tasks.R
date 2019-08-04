#' Modify tasks on the todoist list
#'
#' Only one of the `due_*` can be used at the same time (except `due_lang`).
#'
#' @param content Task content.
#' @param project_id Task project id. If not set, task is put to user's inbox.
#' @param parent Parent task id.
#' @param order Non-zero integer value to sort tasks under the same parent.
#' @param label_ids A vector of strings. Ids of labels associated with the task.
#' @param priority An integer ranging from priority from 1 (normal) to 4 (urgent)
#' @param due_string Human defined task due date (e.g. "next Monday", "Tomorrow"). Value is set using local (not UTC) tie.
#' @param due_date Specific date in YYYY-MM-DD format relative to user's timezone
#' @param due_datetime Specific data and time in RFC3339 format in UTC
#' @param due_lang 2-letter code specifying language in case `due_string` is not written in English.
#' @name tasks
NULL

#' @rdname tasks
#' @export
task_get_all <- function(project_id = NULL,
                        label_id   = NULL,
                        filter     = NULL,
                        lang       = NULL,
                        token      = use_token()) {
    filters <- filter_list_null(project_id = project_id,
                                label_id = label_id,
                                filter = filter,
                                lang = lang)
    httr::GET(url = tasks_api_url,
              header_get(token = token),
              body = filters, encode = "json") %>%
        task_clean()
}

#' Clean up http response
#' @keywords internal
task_clean <- function(response) {
    out_df <- response %>%
        httr::content("text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(flatten = TRUE)
    out_df$label_ids <- paste0(filter_list_null(out_df$label_ids), collapse = ",")
    out_df <- as.data.frame(out_df) %>%
        dplyr::mutate_if(is.factor, as.character)
    names(out_df)[names(out_df) == "due.recurring"] <- "recurring"
    names(out_df)[names(out_df) == "due.string"] <- "due_string"
    names(out_df)[names(out_df) == "due.date"] <- "due_date"
    if("due.datetime" %in% names(out_df)) {
        out_df <- out_df %>%
            dplyr::rename(due_datetime = due.datetime,
                          due_timezone = due.timezone)
    }
    out_df <- out_df %>%
        dplyr::bind_rows(empty_task_df, .) %>%
        dplyr::mutate(due_date = as.Date(due_date),
                      # the following doesn't seem to work
                      due_datetime = format(due_datetime,
                                            format = '%Y-%m-%dT%H:%M:%OSZ',
                                            tz = due_timezone),
                      created = format(created,
                                       format = '%Y-%m-%dT%H:%M:%OSZ'))


}

#' @rdname tasks
#' @export
task_get_by_id <- function(id, token = use_token()) {
    httr::GET(url = paste0(tasks_api_url, "/", id),
              header_get(token = token)) %>%
        task_clean()
}

#' @rdname tasks
#' @export
task_add <- function(content = NULL,
                          project_id = NULL,
                          parent = NULL,
                          order = NULL,
                          label_ids = NULL,
                          priority = NULL,
                          due_string = NULL,
                          due_date = NULL,
                          due_datetime = NULL,
                          due_lang = NULL,
                          token = use_token()) {
    new_task <- filter_list_null(content = content,
                                 project_id = project_id,
                                 parent = parent,
                                 order = order,
                                 label_ids = label_ids,
                                 priority = priority,
                                 due_string = due_string,
                                 due_datetime = due_datetime,
                                 due_lang = due_lang)
    httr::POST(url = tasks_api_url,
               header_post(token),
               body = new_task, encode = "json") %>%
        task_clean()
}




#' @rdname tasks
#' @export
task_update_by_id <- function(id,
                             content      = NULL,
                             label_ids    = NULL,
                             priority     = NULL,
                             due_string   = NULL,
                             due_date     = NULL,
                             due_datetime = NULL,
                             due_lang     = NULL,
                             token        = use_token()) {
    updates <- filter_list_null(content      = content,
                                label_ids    = label_ids,
                                prioirty     = priority,
                                due_string   = due_string,
                                due_date     = due_date,
                                due_datetime = due_datetime,
                                due_lang     = due_lang)
    httr::POST(url = paste0(tasks_api_url, "/", id),
               header_get(token),
               body = updates, encode = "json") %>%
        task_clean()
}

#' @rdname tasks
#' @export
task_close <- function(id, token = use_token()) {
    httr::POST(url = paste0(tasks_api_url, "/", id, "/close"),
               header_get(token)) %>%
        task_clean()
}

#' @rdname tasks
#' @export
task_reopen <- function(id, token = use_token()) {
    httr::POST(url = paste0(tasks_api_url, "/", id, "/reopen"),
               header_get(token)) %>%
        task_clean()
}

#' @rdname tasks
#' @export
task_delete <- function(id, token = use_token()) {
    purrr::walk(id, ~httr::DELETE(url = paste0(tasks_api_url, "/", .x),
                                header_get(token)))
}
