# Need a way to identify and keep track of individual rows, so adding
# a variable "Index" that is a row number I can count on to be stable.

train.plus.options.indexed <- train.plus.options
train.plus.options.indexed["Index"] <- NA
train.plus.options.indexed$Index <- (1:nrow(train.plus.options.indexed))
