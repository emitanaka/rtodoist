
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
`token=...`.

## Modifying projects on todoist

The `rtodoist` R package has a family of functions that can manipulate
and view information on projects. These famliy of functions all start
with `proj_`. E.g. use

``` r
proj_add("My awesome project")
```

to add a new project called “My awesome project”. You will need to have
your token environment setup for this to work or alternatively if you
have your API token string you can supply it to the argument `token`.

``` r
proj_add("My awesome project", token = "<YOUR TOKEN>")
```

Other projected related functions include:

●`proj_add_quick`

●`proj_delete`

●`proj_delete_by_id`

●`proj_get`

●`proj_get_all`

●`proj_get_by_id`

●`proj_update_by_id`

●`proj_update_by_name` .

## Modifying tasks on todoist

Similarily, the `rtodoist` package has a family of functions to modify
and view information on tasks. These functions all start with `task_`.
E.g. use

``` r
task_add(content = "Get rtodoist documentation done.", 
         due_string = "Tomorrow")
```

to add a task that is due tomorrow.

Other task related functions include:

●`task_close`

●`task_delete`

●`task_get_all`

●`task_get_by_id`

●`task_reopen`

●`task_update_by_id` .
