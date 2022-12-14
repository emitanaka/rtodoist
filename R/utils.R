

# some global varibles
projects_api_url <- "https://api.todoist.com/rest/v2/projects"
tasks_api_url    <- "https://api.todoist.com/rest/v2/tasks"

empty_project_df <- data.frame(
  id = integer(),
  name = character(),
  comment_count = integer(),
  order = integer(),
  parent = integer(),
  stringsAsFactors = FALSE
)

empty_task_df <- data.frame(
  id         = integer(),
  project_id = integer(),
  order      = integer(),
  content    = character(),
  completed  = logical(),
  label_ids  = character(),
  priority   = integer(),
  due_date   = character(),
  recurring = logical(),
  due_datetime = character(),
  comment_count = integer(),
  created = character(),
  url           = character(),
  parent = integer(),
  stringsAsFactors = FALSE
)

#' @export
use_token <- function() {
  Sys.getenv("TODOIST_API_TOKEN", "")
}

header_get <- function(token = use_token()) {
  httr::add_headers(
    Authorization = paste("Bearer ", token))
}
header_post <- function(token = use_token()) {
  httr::add_headers(
  Authorization  = paste("Bearer ", token),
  `Content-Type` = "application/json",
  `X-Request-Id` = uuid::UUIDgenerate())
}



# from devtools
yesno <- function(...) {
    yeses <- c("Yes", "Definitely", "For sure", "Yup", "Yeah",
               "I agree", "Absolutely")
    nos <- c("No way", "Not yet", "No", "Nope", "Uhhhh... Maybe not?")
    cat(paste0(..., collapse = ""))
    qs <- c(sample(yeses, 1), sample(nos, 2))
    rand <- sample(length(qs))
    menu(qs[rand]) == which(rand == 1)
}

filter_list_null <- function(...) {
  out <- Filter(Negate(is.null), list(...))
  if(length(out)==1 && length(out[[1]])==0) return("")
  out
}
