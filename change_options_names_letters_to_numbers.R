# Discovered that R doesn't having a variable (column) named "F"
# because "F" is also the logical value for FALSE. Decided to 
# recode A-G to 1-7 to avoid future problems.

names(train.plus.options.indexed2)[names(train.plus.options.indexed2)=="A"] <- "1"
names(train.plus.options.indexed2)[names(train.plus.options.indexed2)=="B"] <- "2"
names(train.plus.options.indexed2)[names(train.plus.options.indexed2)=="C"] <- "3"
names(train.plus.options.indexed2)[names(train.plus.options.indexed2)=="D"] <- "4"
names(train.plus.options.indexed2)[names(train.plus.options.indexed2)=="E"] <- "5"
names(train.plus.options.indexed2)[names(train.plus.options.indexed2)=="F"] <- "6"
names(train.plus.options.indexed2)[names(train.plus.options.indexed2)=="G"] <- "7"
