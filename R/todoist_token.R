#' @name rtodoist
#' @docType package
#' @aliases rtodoist package-rtodoist
#' @import RJSONIO RCurl
NULL


#' todoist_token
#'
#' Returns API token from login credentials.
#' @param email Todoist user email.
#' @param  password Todoist password.
#' @export
#' @keywords authentication
#' @return character string with API token
#' @examples \dontrun{
#' token <- todoist_token("my_email", "my_password")
#'}
todoist_token <- function(email, password) {
url <- "https://todoist.com/API/login"
args <- list(email = email, password = password)
res <- getForm(url, .params = args)
ans <- fromJSON(res)
return(ans$api_token)
}
