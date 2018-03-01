context("Zscore")

test_that("Zscore is correct", {
  set.seed(123)
  v <- rnorm(100)
  expect_equal((v - mean(v)) / sd(v), zscore(v))
  expect_equal(numeric(0), zscore(numeric(0)))
  expect_true(is.na(zscore(1)))
  expect_equal(sum(zscore(1:2)), 0)
  expect_equal(sum(zscore(1:3)), 0)
  expect_equal(sum(zscore(1:4)), 0)
  expect_equal(sum(zscore(1:100)), 0)
})
