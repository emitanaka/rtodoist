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
pending <- function(project_id, token = getOption("TodoistToken"),
    recurring = FALSE) {
    ptasks_url <- "https://todoist.com/API/getUncompletedItems"
    args <- list(project_id = project_id, token = token)
    tasks <- getForm(ptasks_url, .params = args)
    my_tasks <- fromJSON(tasks)
    my_tasks <- ldply(my_tasks, format_tasks)
    if (dim(my_tasks)[1] > 0) {
        if (!recurring) {
            my_tasks <- my_tasks[-grep("^every", my_tasks$due), 1:4]
        }
        if (recurring) {
            my_tasks <- my_tasks[, 1:4]
        }
   return(my_tasks)
    }
}

#'format_date
#'
#' @param date a todoist date
#' @keywords internal
#' @return \code{Date}
format_date <- function(inputdate) {
    if(!is.null(date_string) || nzchar(date_string)) {
    foo <- str_split_fixed(date_string, " ", 5)
    months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
        "Nov", "Dec")
    day <- foo[3]
    month <- foo[2]
    m <- which(months == month)
    year <- foo[5]
    date <- sprintf("%s-%s-%s", m, day, year)
    formatted_date <- as.Date(date, "%m-%d-%Y")
    } else {
        formatted_date <- NA
    }
    return(formatted_date)
}



#' Format tasks
#'
#'<full description>
#' @param task_subset input list
#' @param  recurring logical. Turn off to remove recurring tasks.
#' @keywords internal
format_tasks <- function(task_subset, recurring) {
        result <- data.frame(id = task_subset$id, name = task_subset$content, due = task_subset$due_date, priority = task_subset$priority,
            pid = task_subset$project_id)
    return(result)
    }
