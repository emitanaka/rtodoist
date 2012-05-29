#' add_project
#'
#' Add a new project to Todoist
#' @param project_name  Name of new project
#' @param  token Todoist API token
#' @export
#' @examples \dontrun{
#' add_project("Work", token)
#'}
add_project <- function(project_name, token) {
add_url <- "https://todoist.com/API/addProject"
# check to see if project doesn't already exist.
# add,
# return JSON success
}


#'get_projects
#'
#' retrieves list of projects
#' @param token valid todoist token
#' @export
#' @return data.frame with list of projects
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
