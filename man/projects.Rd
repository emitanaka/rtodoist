\name{projects}
\alias{projects}
\title{get_projects}
\usage{
  projects(token = getOption("TodoistToken"))
}
\arguments{
  \item{token}{valid todoist token}
}
\value{
  data.frame with list of projects
}
\description{
  retrieves list of projects
}
\examples{
\dontrun{
projects <- get_projects(token)
postdoc <- projects[which(projects$name=='Postdoc'),]$id
}
}

