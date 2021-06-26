## Code 2
## Given a string, find the length of the longest substring without repeating characters.

### used break() to break the for loop and next() to skip to the next iteration

input : "abcabcbb"  
output : 3
input : "bbbbb"    
output : 1 
input : "ababcdefdft"    

longest_substr = function(C) {
  len <- NULL
  Str <- NULL 
  for (i in 1:(nchar(C) - 1))
  { 
    s     <- substr(C,i,i)
    count <- 1
    for (j in (i + 1):nchar(C))
    { 
      mark <- 0
      for (k in 1:nchar(s))
      {
         
        if (substr(s,k,k) == substr(C,j,j))
          break
        else 
          mark <- mark + 1
          
      }
      if (mark == nchar(s)) {
        count <- count + 1 
        s     <- paste(s, substr(C,j,j), sep = "")
      }else 
        break
    }
    len <- c(len, count)
    Str <- c(Str, s)
    
  }
  
  L      <- max(len)
  string <- Str[which.max(len)]
  
  
  return(list(string = string, length = L))
  
}

longest_substr("abcabcbb") 


## Given a string, find the length of the longest palindrome

input : "bbabadabct"
output : "badab"


longPalindrome = function(C) {
    count <- 1 ; Pal <- NULL 
    for (i in 1:(nchar(C) - 1))
     {   
         for (j in (i + 1):nchar(C))
         {
           if ( isPalindrome(substr(C,i,j)) == TRUE)
              Pal   <-  c(Pal, substr(C,i,j))
         }
      }
  if (is.null(Pal) == F)
  {
    Pal_string <- Pal[which.max(nchar(Pal))]
    return(list(Pal_string = Pal_string, length = max(nchar(Pal))))
  }else 
    return("There is no palindrome")
   
}
  
  
C = "bbabadabct"

longPalindrome("bbabadabct")

longPalindrome("babad")

longPalindrome("cbbd")


