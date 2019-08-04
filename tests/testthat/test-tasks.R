test_that("get all task information", {
  tsks_df <- tsk_get_all()
  expect_s3_class(tsks_df, "data.frame")
  expect_equal(nrow(tsks_df), 9)
  expect_equal(ncol(tsks_df), 14)
})

test_that("create a dummy project and tasks under it", {
  atsk_df <- tsk_add(content = "Polish this package") # add message
  expect_equal(tsk_get_by_id(atsk_df$id), atsk_df)
  tsk_delete(atsk_df$id)
  atsk_df <- tsk_add(content = "Push on github", due_string = "Tomorrow 8pm")
  tsk_delete(atsk_df$id)
})
