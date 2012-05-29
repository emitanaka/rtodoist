# rtodoist

This is an interface to [Todoist](https://todoist.com) - the todo list manager via `R`. I wrote this primarily for my own sake so I could write custom queries, update my tasks and projects directly from `R`, and also format the queries and write them to text files. This allows me to embed tasks from various projects into my desktop using [Geektool](http://projects.tynsoe.org/en/geektool/).

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

That way all `rtodoist` functions know where to look. Of course, you can also just specifiy it inline.

## Projects
`add_project` - Add a new project to your todoist account

**Usage**: `add_project("New Project")`

`projects` - Lists all your current Todoist projects.

**Usage**: `projects()`

`delete_projects` - Delete a specified Todoist projects.

**Usage**: `projects(project_id)`

## Tasks


## Examples

```r
# Get a list of current projects
my_projects <- projects()
```
