\name{add_project}
\alias{add_project}
\title{add_project}
\usage{
  add_project(project_name,
    token = getOption("TodoistToken"))
}
\arguments{
  \item{project_name}{Name of new project}

  \item{token}{Todoist API token}
}
\description{
  Add a new project to Todoist
}
\examples{
\dontrun{
add_project("Work", token)
}
}

