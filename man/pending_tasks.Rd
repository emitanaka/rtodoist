\name{pending_tasks}
\alias{pending_tasks}
\title{Pending Tasks}
\usage{
  pending_tasks(project_id, token)
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

