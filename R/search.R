#'search_todoist
#'
#' Search Todoist.
#' @param query <what param does>
#' @param  token <what param does>
#' @export
#' @examples \dontrun{
#' search_todoist('today')
#'}
search_todoist <- function(query, token = getOption("TodoistToken")) {
search_url <- "https://todoist.com/API/query"

query <- toJSON(query)
inc_args <- list(token=token, queries=query)
inc_items <- getForm(search_url, .params = inc_args)
results <- fromJSON(inc_items)
res <- results[[1]]$data
if(len(res)>0) {
res2 <- ldply(res, format_tasks)
return(res2)
 }
}
