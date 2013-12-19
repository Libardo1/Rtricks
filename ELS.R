

ELS <- function(formula,data=data,  ...){
  step1 <<- lm(formula=formula,data=data,  ...)
  lm(update(formula, fitted(step1)~.),data=data, ...)
}



## example (with built-in freeny dataset): ELS(formula=y~price.index, data=freeny)

