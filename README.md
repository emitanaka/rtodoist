# rtodoist

This is an interface to [Todoist](https://todoist.com) - the todo list manager via `R`. I wrote this primarily for my own needs so I could write custom queries, update my tasks and projects directly from `R`, and also format the queries and write them to text files. This allows me to embed tasks from various projects into my desktop using [Geektool](http://projects.tynsoe.org/en/geektool/).

## Installing

Package is still in early development but you can install the latest version using the `devtools` package.

```r
library(devtools)
install_github("rtodoist", "karthikram")
```
I also recommend that once you run:

 ```r
 token <- todoist_token('your_todoist_login', 'your_todoist_password')
 ```
 simply save that token in your `.rprofile` by adding the following line:

```r
options(TodoistToken = "YOUR_TOKEN")
```

That way you no longer have to specify a token for any `rtodoist` functions. Of course, you can also just specifiy it inline using `token=...`

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

__Note: There are other API methods that I didn't code up since they aren't critical.__


## Label Functions

`get_labels()` - Get a complete list of labels.

`label_tasks()` - Returns tasks matching a label.

## Search Functions

`search_todoist()` - Search todoist.

## Examples

```r
# Get a list of current projects
my_projects <- projects()
```
