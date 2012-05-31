\name{pending}
\alias{pending}
\title{Pending Tasks}
\usage{
  pending(project_id, token = getOption("TodoistToken"),
    recurring = FALSE)
}
\arguments{
  \item{project_id}{ID of project}

  \item{token}{Todoist API token.}
}
\value{
  data.frame with list of pending tasks for current
  project.
}
\description{
  <full description>
}
\examples{
\dontrun{
pending_tasks(1235, token)
}
}

