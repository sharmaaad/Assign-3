# For question 1, the link of a data frame is downloaded from GitHub
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv", destfile = "gene_expression.tsv")
# reading the data frame, recognising the header while using the first column as the rownames
# avoiding strings to be recognised as Factors
x <-read.table("gene_expression.tsv", header = TRUE, stringsAsFactors = FALSE, row.names = 1)
# checking the first few lines of the data
head(x)
# to read the data correctly, checking the structure of the data
# confirming numerical and integers are being part of the data structure
str(x)
# showing a table of values for the first six genes
# For question 2. subsetting of columns by creating a new column named mean2 for the first six genes 
x$mean2 <- rowMeans(x)
# checking with the first six lines of the data
head(x)
# For question 3. re-ordering the dataframe by the column x$mean2
order(x$mean2)
# then using it in square brackets to re-order
x[order(-x$mean2),]
# sorting 
x_sorted <- x[order(-x$mean2),]
# using head command to figure out 10 genes with the highest mean expression
head(x_sorted,10)
# For question 4. filtering the column "mean2" 
filtered <- subset(x, mean2 > 10)
nrow(filtered)
# For question 5. the hist() function is being used on vectors of dataframe
hist(x$mean2)
# for better distribution of the data, dividing by breaks of 30
hist(x$mean2,breaks=30)
# histogram plot of the mean values in png format saved
# For question 6. another link of data frame is downloaded from GitHub
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv", destfile = "growth_data.csv")
# in order to import the "comma separated" values of the data frame correctly, read.csv() command is being used
y<-read.csv("growth_data.csv")
# reading the data frame, recognising the header
# avoiding strings to be recognised as Factors
y <-read.csv("growth_data.csv", header = TRUE, stringsAsFactors = FALSE)
# checking the structure of the dataframe to confirm that the data structure has only numerical and integers
str(y)
# subset will work because the data values are characters
subset(y,Site=="northeast")
# to name the columns of the dataframe
colnames(y)
# For question 7. 
# subsetting data to find out mean and SD of tree circumference at the start and end of the study at both sites
ne<-subset(y, Site == "northeast")
head(ne)
str(ne)
# to find the mean and SD of tree circumference of northeast site 
mean(ne$Circumf_2004_cm)
mean(ne$Circumf_2019_cm)
sd(ne$Circumf_2004_cm)
sd(ne$Circumf_2019_cm)
# to find the mean and SD of tree circumference of southwest site
sw<-subset(y, Site == "southwest")
head(sw)
str(sw)
mean(sw$Circumf_2004_cm)
mean(sw$Circumf_2019_cm)
sd(sw$Circumf_2004_cm)
sd(sw$Circumf_2019_cm)
# For question 8, boxplot of tree circumference from 2004 to 2019 of northeast and southwest sites
boxplot(ne$Circumf_2004_cm, ne$Circumf_2019_cm, sw$Circumf_2004_cm, sw$Circumf_2019_cm, names = c("ne2004", "ne2019", "sw2004", "sw2019"), ylab="circumference (m)", las=2, main= "Tree growth at two plantation sites")
# For question 9, mean growth over the past 10 years at each site
# subtracting circumferences from year 2019 to 2004 0f both northeast and southwest sites
ne$growth <-ne$Circumf_2019 - ne$Circumf_2004_cm
head(ne)
sw$growth <-sw$Circumf_2019 - sw$Circumf_2004_cm
head(sw)
# For question 10. using the t.test and wilcox.test functions to estimate the p-value that the 10 year growth
t.test(sw$growth, ne$growth)
wilcox.test(sw$growth, ne$growth)
