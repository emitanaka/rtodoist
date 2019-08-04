
# Projecs & Tasks ---------------------------------------------------------

ui_projects <- function(name = NULL, id = NULL) {
  if(is.null(name) & is.null(id)) stop("The project name or id must be supplied.")
  if(!is.null(name) & !is.null(id) && length(name)!=length(id)) {
    stop("The project name and id supplied must be of the same length.")
  }
  if(is.null(id)) {
    id <- ""
  } else {
    id <- crayon::silver(paste0(" (", id, ")"))
  }
  if(is.null(name)) name <- ""
  pjts <- paste0(crayon::blue(name), id)
  paste0(sort(unique(pjts)), collapse = ", ")
}

