# rtodoist

This is an interface to [Todoist](https://todoist.com) - the todo list manager via `R`. I wrote this primarily for my own sake so I could write custom queries, update my tasks and projects directly from `R`, and also format the queries and write them to text files. This allows me to embed tasks from various projects into my desktop using [Geektool](http://projects.tynsoe.org/en/geektool/).

## Installing

Package is still in early development but you can install the latest version using the `devtools` package.

```r
library(devtools)
install_github("rtodoist", "karthikram")
```
I also recommend that once you run `todoist_token()`, simply save your token in your `.rprofile` by adding the following line:

```
options(TodoistToken = "YOUR_TOKEN")
```

That way all `rtodoist` functions know where to look. Of course, you can also just specifiy it inline.

## Projects
`add_project` - Add a new project to your todoist account
Usage: `add_project("New Project")`
