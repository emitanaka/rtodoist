todoist_token <-
function(email, password) {
url <- "https://todoist.com/API/login"
args <- list(email = email, password = password)
res <- getForm(url, .params = args)
ans <- fromJSON(res)
return(ans$api_token)
}
