with_mock_api <- capture_requests
with_mock_api({
  test_that("project information is extracted correctly", {
    pjts_df <- pjt_get_all()
    expect_s3_class(pjts_df, "data.frame")
    expect_equal(nrow(pjts_df), 2)
    expect_equal(ncol(pjts_df), 5)
    expect_equal(pjt_get_by_id(pjts_df$id), pjts_df)
    expect_equal(pjt_get(id = pjts_df$id), pjts_df)
    expect_equal(pjt_get(name = pjts_df$name), pjts_df)
  })
  test_that("project is added & deleted correctly", {
    new_project_name <- "Dummy Project"
    pjt_add_quick(new_project_name)
    apjt_df <- pjt_get(new_project_name)
    expect_s3_class(apjt_df, "data.frame")
    expect_equal(apjt_df$name, new_project_name)
    expect_message(pjt_delete(new_project_name, prompt = FALSE))
    expect_error(pjt_get(new_project_name))
  })
  test_that("project name updated correctly", {
    old_project_name <- "P1"
    new_project_name <- "P2"
    pjt_add_quick(old_project_name) # need to add messages
    pjt_update_by_name(old_project_name, new_project_name) # need to add messages
    apjt_df <- pjt_get(new_project_name)
    expect_equal(apjt_df$name, new_project_name)
    pjt_delete(new_project_name, prompt = FALSE)
  })
})


