#' rTodoist - An R interface to Todoist.com
#'
#' @name rtodoist
#' @docType package
#' @aliases rtodoist package-rtodoist
#' @import RJSONIO RCurl plyr
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
#' token <- todoist_token('my_email', 'my_password')
#'}
todoist_token <- function(email = NULL, password = NULL) {
	if(is.null(email) || is.null(password))
		stop("Todoist email and password required to retrieve token.\n Usage: todoist_token(\'your_todoist_email\',\'your_todoist_password\')")

    url <- "https://todoist.com/API/login"
    args <- list(email = email, password = password)
    res <- getForm(url, .params = args)
    ans <- fromJSON(res)
    return(ans$api_token)
}
