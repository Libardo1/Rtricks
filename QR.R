#### OLS by hand
solve(qr.R(qr(freeny.x)))%*%t(qr.Q(qr(freeny.x)))%*%freeny.y

QR1<- qr(freeny.x)
solve(qr.R(QR1))%*%t(qr.Q(QR1))%*%freeny.y
solve(qr.R(QR1))%*%crossprod(qr.Q(QR1),freeny.y)
backsolve(qr.R(QR1),crossprod(qr.Q(QR1),freeny.y))

coef(lm(freeny.y~freeny.x -1))


library(rbenchmark)

benchmark(solve(qr.R(QR1))%*%t(qr.Q(QR1))%*%freeny.y,
          solve(qr.R(QR1))%*%crossprod(qr.Q(QR1),freeny.y),
          backsolve(qr.R(QR1),crossprod(qr.Q(QR1),freeny.y)),
          replications=1000)

method_1 <- function(X,y) solve(crossprod(X))%*%crossprod(X,y)
method_2 <- function(X,y) {
  QR1<- qr(X)
  backsolve(qr.R(QR1),crossprod(qr.Q(QR1),y))
}

all.equal(method_1(freeny.x, freeny.y),method_2(freeny.x, freeny.y),
          check.attributes=FALSE)

benchmark(method_1(freeny.x, freeny.y),
          method_2(freeny.x, freeny.y),
          replications=1000)