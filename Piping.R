### piping became famous with tidyverse. 
### %>%  forward pipe operator
### lets you pass an intermediate result onto the next function.

pi %>% sin %>% cos

####  cos(sin(pi))

pi %>% sin 

iris %>% subset(Sepal.Length > 5)

## In fact, having a standardized chain of processing actions is called "a pipeline".


x <- c(0.109, 0.359, 0.63, 0.996, 0.515, 0.142, 0.017, 0.829, 0.907)
round(exp(diff(log(x))), 1)


x  %>%  log() %>% diff %>%  exp()  %>% round(.,1)


### f(x) can be rewritten as x %>% f 

x %>% log()   

4.555  %>% round(2)

paste(1:5, letters[1:5])

paste(1:5, 1:5)

paste("Rahman", "Shahina")

1:5 %>% 
  paste( ., letters[.])
  
# Unary function
f <- . %>% cos %>% sin 

sin(cos(4))
f(4)




