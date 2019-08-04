
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rtodoist

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

This R package is an interface to [todoist](https://todoist.com) - the
todo list manager.

## Installation

Package is still in early development but you can install the latest
version using the `devtools` package.

``` r
# install.packages("devtools")
devtools::install_github("karthik/rtodoist")
```

## Getting your API token

First you will need to get the API token from your account. If you login
to your todoist account, you can find this under Settings \>
Integrations \> API token or by clicking
[here](https://todoist.com/prefs/integrations) and scroll to the bottom.

You are recommended that you place your token in the `.Renviron` file by
adding to it:

    TODOIST_API_TOKEN=<INSERT YOUR TOKEN>

The easiest way to access the `.Renviron` is to use
`usethis::edit_r_environ()`.

That way you no longer have to specify a token for any `rtodoist`
functions. Of course, you can also just specifiy it inline using
`token=...`

## Project Functions

`add_project` - Add a new project to your Todoist account

**Usage**: `add_project("New Project")`

`projects` - Lists all your current Todoist projects.

**Usage**: `projects()`

`delete_projects` - Delete a specified Todoist projects.

**Usage**: `projects(project_id)`

## Task Functions

`pending` - returns incomplete tasks from a specified project.

`add_task` - Add a task to a particular project.

**Note: There are other API methods that I didn’t code up since they
aren’t critical.**

## Label Functions

`get_labels()` - Get a complete list of labels.

`label_tasks()` - Returns tasks matching a label.

## Search Functions

`search_todoist()` - Search todoist.

## Examples

``` r
# Get a list of current projects
my_projects <- projects()
```
