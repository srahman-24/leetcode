## Code 2
## Given a string, find the length of the longest substring without repeating characters.

input : "abcabcbb"  12312322
output : 3
input : "bbbbb"    22222
output : 1 
input : "ababcdefdft"    2 1 3 2 4 5 6 4 6 28

longest_substr = function(C){
  len = NULL
  Str = NULL 
  for (i in 1:(nchar(C)-1))
  { 
    s = substr(C,i,i)
    count = 1
    for (j in (i+1):nchar(C))
    { 
      for(k in 1:nchar(s))
      {
        mark = 0
        if (substr(s,k,k) != substr(C,j,j))
        { 
          mark = mark + 1 
        }
      }
      if (mark < nchar(s))
      {
      len <- c(len, count)
      }
      else 
      { 
      len <- c(len, count + 1)
      count = count + 1 
      s   <- paste(s, substr(C,j,j), sep = "")
      }
      
      Str = c(Str, s)
      
    }
    
    L      = max(len)
    string = Str[which.max(len)]
    
    return(list(string = string, length = L))
    
  }
  
}

longest_substr("abc")
