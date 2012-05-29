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
current <- get_projects(token)
current_projects <- current$name
if(project_name %in% current_projects) {
	stop("Project already exists")
	} else {

args <- list(name = project_name, token = token)
add_p <- postForm(add_url, name=project_name, token=token)
result <- fromJSON(add_p)
return (result)
	}
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
