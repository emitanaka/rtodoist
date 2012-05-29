
library(RJSONIO)
library(RCurl)


#'todoist_token
#'
#' Connects to todoist and retrieves API token
#' @param email Your registered email
#' @param  password Your password
#' @export
#' @keywords authentication
#' @seealso
#' @return character (token)
#' @alias
#' @examples \dontrun{
#' token <- todoist_token("karthik@ucdavis.edu", "wfish82")
#'}
todoist_token <- function(email, password) {
url <- "https://todoist.com/API/login"
args <- list(email = email, password = password)
res <- getForm(url, .params = args)
ans <- fromJSON(res)
return(ans$api_token)
}



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


#'<brief desc>
#'
#'<full description>
#' @param project_name <what param does>
#' @param  token <what param does>
#' @export
#' @keywords
#' @seealso
#' @return
#' @alias
#' @examples \dontrun{
#'
#'}
add_project <- function(project_name, token) {
add_url <- "https://todoist.com/API/addProject"
# check to see if project doesn't already exist.
# add,
# return JSON success
}



search_todoist <- function(query, token) {

}

todoist_incomplete <- function(project_id, token) {

}

search_url <- "http://todoist.com/API/query"
query <- toJSON("29")
inc_args <- list(token=token, queries=query)
inc_items <- getForm(search_url, .params = inc_args)
tasks <- fromJSON(inc_items)
x <- tasks[[1]]$data
overdue <- ldply(x, function(z) data.frame(task=z$content, due=str_sub(z$due_date,start=4, end=-15)))
overdue

search_url <- "http://todoist.com/API/query"
query <- "[\"today\"]"
inc_args <- list(token=token, queries=query)
inc_items <- getForm(search_url, .params = inc_args)
tasks <- fromJSON(inc_items)
x <- tasks[[1]]$data
today <- ldply(x, function(z) data.frame(task=z$content, due=str_sub(z$due_date,start=4, end=-15)))
today

