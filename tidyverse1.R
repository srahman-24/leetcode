### text data 
### tidy data principles

#### "Pride and Prejudice" and "The War of the Worlds"

install.packages("tidytext")

library(tidyverse)
library(gutenbergr)

titles = c( "The War of the Worlds",  "Pride and Prejudice")

#### %>% is called piping 

books <- gutenberg_works(title %in% titles) %>%
         gutenberg_download(meta_fields = "title") %>%
         mutate(document = row_number()) 
books


### transform our text data into a tidy format.
library(tidytext)

tidy_books <- books %>%
     unnest_tokens(word, text) %>%
     group_by(word) %>%
     filter(n() > 10) %>%           # removing the rare words. 
     ungroup()


tidy_books

# looking at the most frequent words in each book (distribution would be different)

tidy_books %>%
  count(title, word, sort = TRUE) %>%
  anti_join(get_stopwords()) %>%
  group_by(title) %>%
  top_n(20) %>%
  ungroup() %>%
  ggplot(aes(reorder_within(word, n, title), n,
             fill = title
  )) +
  geom_col(alpha = 0.8, show.legend = FALSE) +
  scale_x_reordered() +
  coord_flip() +
  facet_wrap(~title, scales = "free") +
  scale_y_continuous(expand = c(0, 0)) +
  labs(
    x = NULL, y = "Word count",
    title = "Most frequent words after removing stop words",
    subtitle = "Words like 'said' occupy similar ranks but other words are quite different"
  )



#### rsample package to split into training and testing 

install.packages("rsample")
library("rsample")
library(rsample)

books_split <- books %>%
  select(document) %>%
  initial_split()
train_data <- training(books_split)
test_data <- testing(books_split)


### Transform training data from a tidy data structure to a sparse matrix 

sparse_words <- tidy_books %>%
  count(document, word) %>%
  inner_join(train_data) %>%
  cast_sparse(document, word, n)

class(sparse_words)

dim(sparse_words)

## There are 12,028 training observations and 1652 features at this point. 
## Text feature space handled in this way is very high dimensional. 

### Use a regularized regression/ classification algorithm.

word_rownames = as.integer(rownames(sparse_words))


books_joined <- data_frame(document = word_rownames) %>%
  left_join(books %>% 
              select(document, title))


#### it’s time to train our classification model ! 
#### Let’s use the glmnet package to fit a logistic regression model with LASSO regularization.
#### It’s a great fit for text classification because the variable selection that LASSO regularization performs 
#### can tell you which words are important for your prediction problem. 
#### The "glmnet package" also supports parallel processing with very little hassle.
#### so we can train on multiple cores with cross-validation on the training set. 

library(Matrix)
library(glmnet)
library(doMC)

registerDoMC(cores = 8)

is_jane <- books_joined$title == "Pride and Prejudice"
model <- cv.glmnet(sparse_words, is_jane, family = "binomial",  parallel = TRUE, keep = TRUE)
plot(model)

### dig it into glmnet for using logistic coefficient. And iterpret them. 

### Also understanding piping 







