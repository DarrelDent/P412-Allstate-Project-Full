# tpoindexed.numopt is a copy of "training" dataset that has the "Options" 
# variable (values of A-G) appended, that has "Index" appended, and that has 
# the alphabetical coverage options A though G converted to numerical 1 through 7.

# Now to make customer_ID a factor variable to make it easier to do processing
# (such as selecting the maximum shopping_pt by customer_ID) easier. First create
# the target dataframe.

tpoindexed.numopt.factorized <- tpoindexed.numopt

# Now factorize customer_ID in the new dataframe.

tpoindexed.numopt.factorized$customer_ID <- 
  as.factor(tpoindexed.numopt.factorized$customer_ID)

# tpo.indexed.numopt.factorized is too long a name!
# Shorten to make it easier to work with.

tr.op.in.fac <- tpoindexed.numopt.factorized

# Create a subset of purchase-point records

tr.op.in.fac.purpt <- tr.op.in.fac[tr.op.in.fac$record_type == 1,]

# First step in creating a subset of the maximum purchase_pt 
# records aggregated by customer_ID. First, create a dataframe
# that contains the aggregated customer_ID and shopping_pt data.

tr.op.in.fac.spmax <- aggregate(tr.op.in.fac$shopping_pt ~
                                tr.op.in.fac$customer_ID,
                                data = tr.op.in.fac, max)

# The aggregate() function outputs very long (and confusing)
# column names.  Rename columns to match the original names.

names(tr.op.in.fac.spmax)[1] <- "customer_ID"
names(tr.op.in.fac.spmax)[2] <- "shopping_pt"

# Because the Index is a sequential row count, it equals the 
# cumulative total of the maximum shopping points by customer_ID.
# So, I can create a vector (variable) with the correct Index values
# using the "cumsum" function and append the variable (spIndex)
# to the end of the dataframe. I used spIndex to clarify that this
# is the Index number associated with the max shopping_pt.

tr.op.in.fac.spmax["spIndex"] <- cumsum(tr.op.in.fac.spmax$shopping_pt)

# I will also rename Index in the purchase_pt file for consistency.

names(tr.op.in.fac.purpt)[names(tr.op.in.fac.purpt) == "Index"] <- "ppIndex"

# Now I can merge the purchase point (record_type) and shopping_pt
# files by customer_ID to create a single file with both the max
# shopping point and purchase point by customer, along with the record
# indexes to the original file.

tr.op.in.fac.chron <- merge(tr.op.in.fac.purpt, tr.op.in.fac.spmax, 
                            by = "customer_ID")

# The new dataframe has two shopping_pt columns, one from the "purpt"
# dataframe and one from the "spmax" dataframe. But when I try to drop
# either one, I also lose 10 other variables! It appears that once a dataframe 
# is joined on a variable, the join remains "live" and I will have to
# keep both variables.

tr.op.in.fac.chron <- tr.op.in.fac.chron[-tr.op.in.fac.chron$shopping_pt.x]

