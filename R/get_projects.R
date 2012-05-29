#'get_projects
#'
#' retrieves list of projects
#' @param token valid todoist token
#' @export
#' @keywords
#' @seealso
#' @return
#' @alias
#' @examples \dontrun{
#' projects <- get_projects(token)
#' postdoc <- projects[which(projects$name=="Postdoc"),]$id
#'}
get_projects <- function(token) {
# Get projects from todoist
projects_url <- "https://todoist.com/API/getProjects"
args2 <- list(token = token)
tt2 <- getForm(projects_url, .params =args2)
ans2 <- fromJSON(tt2)
return(ldply(ans2, data.frame))
}

get_tasks <- function(project_id, token) {
tasks_url <- ""
}
