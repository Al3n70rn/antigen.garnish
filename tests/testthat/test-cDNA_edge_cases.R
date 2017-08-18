library(testthat)
library(antigen.garnish)
library(data.table)
library(magrittr)
library(dt.inflix)

testthat::test_that("make_cDNA", {

  # load test data

  dt <- data.table::data.table(
      cDNA_type = c(">", ">", "ins", "del", ">", "del", "delins"),
      coding = c(LETTERS %>% paste(collapse = "")),
      cDNA_locs = c(7L, 1L, 14L, 4L, 100L, 1L, 14L),
      cDNA_locl = c(7L, 1L, 14L, 7L, 100L, 23L, 16L),
      cDNA_seq = c("*", "*", "$$$$$", "", "*", "", "**"))

  # run test
  dto <- make_cDNA(dt)

  # visually inspect
  dto[, `:=`(coding_l = coding %>% nchar,
          coding_mut_l = coding_mut %>% nchar,
          ldelta =  (coding_mut %>% nchar) - (coding %>% nchar)
          )] %>% print

  testthat::expect_equivalent(dto,
              data.table(
                cDNA_type = c(">", ">", "ins", "del", "del", "delins"),
                coding = c("ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                cDNA_locs = c(7L, 1L, 14L, 4L, 1L, 14L),
                cDNA_locl = c(7L, 1L, 14L, 7L, 23L, 16L),
                cDNA_seq = c("*", "*", "$$$$$", "", "", "**"),
                coding_mut = c("ABCDEF*HIJKLMNOPQRSTUVWXYZ",
                "*BCDEFGHIJKLMNOPQRSTUVWXYZ", "ABCDEFGHIJKLMN$$$$$OPQRSTUVWXYZ",
                "ABCHIJKLMNOPQRSTUVWXYZ", "XYZ", "ABCDEFGHIJKLMQ**RSTUVWXYZ"),
                coding_l = c(26L, 26L, 26L, 26L, 26L, 26L),
                coding_mut_l = c(26L, 26L, 31L, 22L, 3L, 25L),
                ldelta = c(0L, 0L, 5L, -4L, -23L, -1L))
)
    })