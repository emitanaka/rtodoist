\name{get_projects}
\alias{get_projects}
\title{get_projects}
\usage{
  get_projects(token)
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
postdoc <- projects[which(projects$name=="Postdoc"),]$id
}
}

