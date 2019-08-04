test_that("ui works as intended",  {
  expect_error(ui_projects())
  expect_error(ui_projects("P1", id = 1:2))
  expect_equal(ui_projects(c("P1", "P2")),
               "\033[34mP1\033[39m, \033[34mP2\033[39m")
  expect_equal(ui_projects(id = c(1, 2)),
               "\033[34m\033[39m\033[90m (1)\033[39m, \033[34m\033[39m\033[90m (2)\033[39m")
  expect_equal(ui_projects(c("P1", "P2"), id = c(1, 2)),
               "\033[34mP1\033[39m\033[90m (1)\033[39m, \033[34mP2\033[39m\033[90m (2)\033[39m")
})
