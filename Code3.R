##### Code 3

#### Fibonnaci sequence 



output : 0,1,1,2,3,5,8,13,...

fibonnaci = function(nterms)
{   
    fib = NULL 
    if (nterms <= 0)
    {
      print("Enter a positive integer")
    }else {
    count1  <- 0
    count2  <- 1
    fib  <- c(count1, count2)
    for (i in 3:nterms)
    {
      count <- count1 + count2
      fib  <- c(fib, count)
      count1 <- count2
      count2 <- count
    }
    }
      print("Fibonacci sequence :")
      return(fib)
    
}

fibonnaci(-3)


#### An Armstrong number, also known as narcissistic number,
#### is a number that is equal to the sum of the cubes of its own digits.

num  = a1^3 + a2^3 + a3^3 

isArmstrong  =  function(num)
{
     digit = NULL
     for (i in 1:nchar(paste(num)))
     {
       digit =  c(digit, as.integer(substr(paste(num),i,i)))
     }
     if (sum(digit^3) == num)
     {
       return(TRUE)
     }else 
       return(FALSE)
  
}

isArmstrong(23)
isArmstrong(370)





