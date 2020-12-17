library(softImpute)
source_url('https://raw.githubusercontent.com/R-miss-tastic/website/master/static/how-to/generate/amputation.R')

#### cv_sft: it performs a cross-validation to return the best nuclear-norm regularization parameter for softImpute ####
# y: matrix which contains missing values. 
# N: number of simulations for the cross-validation
# len: length of the grid which is tested in the cross-validation


cv_sft <- function(y,
                   N = 10,
                   len = 20) {
  y <- as.matrix(y)
  Y2 <- y
  Y2[is.na(Y2)] <- 0
  d <- dim(y)
  n <- d[1]
  p <- d[2]
  m <- sum(!is.na(y))
  lambda1.max <- max(svd(Y2)$d)
  lambda1.min <- 1e-3*lambda1.max
  grid.lambda1 <-
    exp(seq(log(lambda1.min), log(lambda1.max), length.out = len))
  ylist <-
    lapply(1:N, function(k)
      produce_NA(as.matrix(y), perc.missing = 0.2))$data.incomp
  res.cv <- lapply(1:N, function(k) {
    sapply(1:len,
           function(i) {
             yy <-produce_NA(as.matrix(y), perc.missing = 0.2)$data.incomp
             res <-
               softImpute(as.matrix(yy),
                          lambda = grid.lambda1[i], maxit = 1000)
             u <- res$u
             d <- res$d
             v <- res$v
             if (is.null(dim(u))) {
               res <- d * u %*% t(v)
             } else {
               res <- u %*% diag(d) %*% t(v)
             }
             imp <- as.matrix(yy)
             imp[is.na(yy)] <- res[is.na(yy)]
             return(sqrt(sum((res - y) ^ 2, na.rm = T)))
           })
    
  })
  res.cv <- colMeans(do.call(rbind, res.cv))
  l <- which.min(res.cv)
  lambda <- grid.lambda1[l]
  return(lambda)
}
