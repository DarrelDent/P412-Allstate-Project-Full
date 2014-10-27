# Make customer_ID a factor variable to make it easier to do processing
# (such as selecting the maximum shopping_pt by customer_ID) easier.

tpoindexed.numopt.factorized <- tpoindexed.numopt

tpoindexed.numopt.factorized$customer_ID <- 
  as.factor(tpoindexed.numopt.factorized$customer_ID)
