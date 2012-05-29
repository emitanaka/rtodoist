#' Pending Tasks
#'
#'<full description>
#' @param project_id ID of project
#' @param  token Todoist API token.
#' @export
#' @return data.frame with list of pending tasks for current project.
#' @examples \dontrun{
#' pending_tasks(1235, token)
#'}
incomplete_tasks <- function(project_id, token = getOption('TodoistToken'), recurring = FALSE) {
ptasks_url <- "https://todoist.com/API/getUncompletedItems"
args <- list(project_id = project_id, token = token)
tasks <- getForm(ptasks_url, .params = args)

format_tasks <- function(foo, recurring) {
	result <- data.frame(id=foo$id, name=foo$content, due=foo$date, priority = foo$priority, pid = foo$project_id, ds = foo$date_string)
}
my_tasks <- fromJSON(tasks)
my_tasks <- ldply(my_tasks, format_tasks)

if(!recurring) {
my_tasks <- my_tasks[-grep("^every", my_tasks$ds),1:4]
}

if(recurring) {
	my_tasks <- my_tasks[,1:4]
}
temp <- ddply(my_tasks, .(id), summarize, due_date = format_date(due))
my_tasks <- join(my_tasks,temp,by="id",type="left")
my_tasks <- my_tasks[,-3]
return (my_tasks)
}


#' get_tasks
#'
#' Returns a list of tasks from a specified project
#' @param project_id ID of project
#' @param  token Todoist API token.
#' @export
#' @examples \dontrun{
#' get_tasks(12345, token)
#'}
get_tasks <- function(project_id, token = getOption('TodoistToken')) {
tasks_url <- "https://todoist.com"
}


#'format_date
#'
#' @param date a todoist date
#' @keywords internal
#' @return Date
format_date <- function(date_string) {
date_string <- str_split_fixed(date_string, " ", 3)
months <- c("Jan","Feb","Mar","Apr","May", "Jun","Jul","Aug","Sep","Oct","Nov","Dec")
day <- str_sub(date_string[3],1,2)
month <- date_string[2]
m <- which(months==month)
year <- date_string[3]
date <- sprintf("%s-%s-%s",m,day,year)
formatted_date <- as.Date(date, "%m-%d-%Y")
return(formatted_date)
}

