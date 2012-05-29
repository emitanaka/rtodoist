#' add_project
#'
#' Add a new project to Todoist
#' @param project_name  Name of new project
#' @param  token Todoist API token
#' @export
#' @examples \dontrun{
#' add_project("Work", token)
#'}
add_project <- function(project_name, token = getOption('TodoistToken')) {
add_url <- "https://todoist.com/API/addProject"
current_projects <- projects(token)
if(project_name %in% current_projects$name) {
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
projects <- function(token = getOption('TodoistToken')) {
projects_url <- "https://todoist.com/API/getProjects"
args2 <- list(token = token)
tt2 <- getForm(projects_url, .params =args2)
ans2 <- fromJSON(tt2)
return(ldply(ans2, data.frame))
}


#' delete_project
#'
#' Deletes an existing Todoist project
#' @param project_name <what param does>
#' @param  token = getOption('TodoistToken') <what param does>
#' @export
#' @examples \dontrun{
#' delete_project("unwanted_project")
#'}
delete_project <- function(project_name, token = getOption('TodoistToken')) {
delete_url <- "https://todoist.com/API/deleteProject"
current_projects <- get_projects(token)
if(!(project_name %in% current_projects$name)) {
	stop("Project not found.")
	} else {
confirm <- readLine()
if(upper(confirm)=="Y") {
pj_id <- current[which(current$name==project_name),]$id
args <- list(project_id = pj_id, token = token)
result <- fromJSON(add_p)
return (result)
	}
}
}


