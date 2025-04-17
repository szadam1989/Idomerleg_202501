#Az ALTEV4ékenységekre vonatkozó oszlopok üresség ellenőrzése
ALTEV4_NULL_IN_COLUMNS <- sapply(FOTEV4TABLE, function(x) sum(is.na(x)))
View(ALTEV4_NULL_IN_COLUMNS)
rownames(ALTEV4_NULL_IN_COLUMNS)
colnames(ALTEV4_NULL_IN_COLUMNS)
names(ALTEV4_NULL_IN_COLUMNS)

nullvalues <- cbind(names(ALTEV4_NULL_IN_COLUMNS), ALTEV4_NULL_IN_COLUMNS) #as.data.frame(ALTEV4_NULL_IN_COLUMNS)
View(nullvalues)
rownames(nullvalues)
colnames(nullvalues)
names(nullvalues)

nullvalues <- cbind(rownames(nullvalues), data.frame(nullvalues, row.names = NULL))

colnames(nullvalues) <- c("row", "column", "value")
nullvalues <- subset(nullvalues, select = c("column", "value"))

View(subset(nullvalues, value == nrow(ALAP4)))

dim(FOTEV4TABLE)#3753 sor és 2752 oszlop


delete <- subset(nullvalues, value == nrow(ALAP4), "column")
View(delete)#924

delete_ALTEV4 <- subset(delete, nchar(column) > 10, "column")
View(delete_ALTEV4)#584 sor, vagyis törlendő oszlop

FOTEV4TABLE_MENT <- FOTEV4TABLE
#FOTEVTABLE <- FOTEVTABLE_MENT
dim(FOTEV4TABLE_MENT)#3753 sor és 2752 oszlop

library(dplyr)  
for(j in 1:nrow(delete_ALTEV4)){
  
  FOTEV4TABLE <- FOTEV4TABLE %>% select(-ends_with(c(delete_ALTEV4[j, "column"])))
  print(paste0(delete_ALTEV4[j, "column"], " törölve"))
  
}

dim(FOTEV4TABLE)#3753 sor és 2168 oszlop