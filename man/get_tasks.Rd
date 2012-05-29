\name{get_tasks}
\alias{get_tasks}
\title{get_tasks}
\usage{
  get_tasks(project_id, token = getOption("TodoistToken"))
}
\arguments{
  \item{project_id}{ID of project}

  \item{token}{Todoist API token.}
}
\description{
  Returns a list of tasks from a specified project
}
\examples{
\dontrun{
get_tasks(12345, token)
}
}

