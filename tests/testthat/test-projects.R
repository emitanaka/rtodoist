with_mock_api <- capture_requests
with_mock_api({
  test_that("project information is extracted correctly", {
    projs_df <- proj_get_all()
    expect_s3_class(projs_df, "data.frame")
    expect_equal(nrow(projs_df), 2)
    expect_equal(ncol(projs_df), 5)
    expect_equal(proj_get_by_id(projs_df$id), projs_df)
    expect_equal(proj_get(id = projs_df$id), projs_df)
    expect_equal(proj_get(name = projs_df$name), projs_df)
  })
  test_that("project is added & deleted correctly", {
    new_project_name <- "Dummy Project"
    proj_add_quick(new_project_name)
    aproj_df <- proj_get(new_project_name)
    expect_s3_class(aproj_df, "data.frame")
    expect_equal(aproj_df$name, new_project_name)
    expect_message(proj_delete(new_project_name, prompt = FALSE))
    expect_error(proj_get(new_project_name))
  })
  test_that("project name updated correctly", {
    old_project_name <- "P1"
    new_project_name <- "P2"
    proj_add_quick(old_project_name) # need to add messages
    proj_update_by_name(old_project_name, new_project_name) # need to add messages
    aproj_df <- proj_get(new_project_name)
    expect_equal(aproj_df$name, new_project_name)
    proj_delete(new_project_name, prompt = FALSE)
  })
})


