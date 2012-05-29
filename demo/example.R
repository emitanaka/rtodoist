
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
