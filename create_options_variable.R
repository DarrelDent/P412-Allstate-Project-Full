# Use paste() function to combine option variables from training
# dataset into one character variable named "Options" appended
# to the end of the dataframe.

train.plus.options$Options <- paste(train$A, train$B, 
                                    train$C, train$D, 
                                    train$E, train$F, 
                                    train$G, sep = "")