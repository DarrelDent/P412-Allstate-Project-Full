unique.identifier <- c(tpoindexed.numopt$customer_ID,
                       tpoindexed.numopt$shopping_pt,
                       tpoindexed.numopt$record_type)[
                         unique(tpoindexed.numopt$customer_ID, fromLast=TRUE)]