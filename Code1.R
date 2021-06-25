# Coding for interview

x = c(1, 7, 2, 11)
a = 9

##### 1. Two sums #####

twoSums = function(x,a){
ts = NULL
for (i in 1:(length(x) - 1)) 
{
   for (j in (i + 1):length(x))
   {
      if (x[i] + x[j] == a)
      {
        ts = rbind(ts, c(i,j))
      }
   }
}
  return(ts)
}

x = c(1, 7, 2, 8)
a = 9

twoSums(x, a)


##### 2. Three sums #####

threeSums = function(x){
  ts = NULL 
  for (i in 1:(length(x) - 2)) 
  {
    for (j in (i + 1):(length(x) - 1))
    {
      for (k in (j + 1):length(x)) {
           if (x[i] + x[j] + x[k] == 0)
              {
                 ts = rbind(ts, c(i,j,k))
              } 
      }
    }
  }
  return(ts)
}  

x = c(-1, 0, 1, 2, -1, -4)

threeSums(x)

##### 3. Palindrome  
##### substr(), floor(), nchar()
 
palindrome = function(x)
{
  for (i in 1:floor(nchar(x)/2))
  {
      if (substr(x, i, i) != substr(x, (nchar(x) - i + 1), (nchar(x) - i + 1)))
      {
          return("not a palindrome")
      }
  }
  return("palindrome")
  
}

palindrome("abdcdba")



##### 4. Reverse the name

x = "shahina" 

reverse = function(x){
  y = x 
  
  for (i in 1:nchar(x))
  {
    substr(y, i, i) = substr(x, nchar(x) - i + 1, nchar(x) - i + 1)
  }
  
  return(y)
  
}

reverse(x)


#### 5. remove the duplicates and sort 

x = c( 4, 1, 2, 4, 1, 8, 9, 9)

sort(unique(x))

### 6. sort the duplicates 

sort(x[duplicated(x)])

### 7. Given an array nums of n integers and an integer target, 
### find three integers in nums such that the sum is closest to target. 
### Return the sum of the three integers.

x = c(-1, 2, 1, -4)
t = 1


sum_close = function(x, t){
  
ss  = x[order(abs(x - t)) == 1] + x[order(abs(x - t)) == 2] + x[order(abs(x - t)) == 3] 

ind = sort(c(which(order(abs(x - t)) == 1), which(order(abs(x - t)) == 2), which(order(abs(x - t)) == 3)))

return(list(sum = ss, indices = ind))
}

sum_close(x, -3)


### adding two strings 

num1 <- "2" 
num2 <- "4"
output = "6"

output <- as.numeric(num1) + as.numeric(num2)
print(as.character(output))


### storing the integer in array 

a = 123 
out = c(1, 2, 3)

array_int = function(a) {
    
    if (is.numeric(a) == F) {
      return("input should be a number")
    }else{
        out <- NULL  
        for (i in 1:nchar(as.character(a))) {
            out <- c(out, as.numeric(substr(a,i,i))) 
         }
         return(out)
        }
}

array_int(56988713)

##### Add array-form of integer 


a = c(1, 2, 3, 4, 5)
K = 20 
out = c(1, 2, 3, 6, 5)

array_sum = function(a, K) {
    
    #check a in a vector 
    #check K is an integer  
    out <- NULL 
    for (i in 1:length(a)) {
        out <- paste(out, a[i], sep = "") 
    }
    return(array_int(as.numeric(out) + K))
} 

array_sum(a, K)







