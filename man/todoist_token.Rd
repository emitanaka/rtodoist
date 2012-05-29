\name{todoist_token}
\alias{todoist_token}
\title{todoist_token}
\usage{
  todoist_token(email, password)
}
\arguments{
  \item{email}{Todoist user email.}

  \item{password}{Todoist password.}
}
\value{
  character string with API token
}
\description{
  Returns API token from login credentials.
}
\examples{
\dontrun{
token <- todoist_token("my_email", "my_password")
}
}
\keyword{authentication}

