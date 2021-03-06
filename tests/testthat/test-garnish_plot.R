testthat::test_that("garnish_plot", {

  on.exit(list.files(pattern = "(antigen.garnish.*\\.pdf)|(antigen.garnish_example_jaffa)") %>% file.remove)

  # load test data
    dt <- data.table::fread("http://get.rech.io/antigen.garnish_example_jaffa_output.txt")

    garnish_plot(dt)

  # run test
    testthat::expect_equal(list.files(pattern = "antigen.garnish.*summary.*\\.pdf") %>% length, 3)
    testthat::expect_equal(list.files(pattern = "antigen.garnish.*score.*\\.pdf") %>% length, 2)

})

