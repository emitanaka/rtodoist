test_that("get all task information", {
  tasks_df <- task_get_all()
  expect_s3_class(tasks_df, "data.frame")
  expect_equal(nrow(tasks_df), 9)
  expect_equal(ncol(tasks_df), 14)
})

test_that("create a dummy project and tasks under it", {
  atask_df <- task_add(content = "Polish this package") # add message
  expect_equal(task_get_by_id(atask_df$id), atask_df)
  task_delete(atask_df$id)
  atask_df <- task_add(content = "Push on github", due_string = "Tomorrow 8pm")
  task_delete(atask_df$id)
})
