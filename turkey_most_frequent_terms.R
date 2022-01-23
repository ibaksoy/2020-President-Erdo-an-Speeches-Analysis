install.packages("tm") #Install the required packages
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("dplyr")
install.packages("tidytext")
install.packages("tokenizers")
install.packages("NLP")
install.packages("readr")
install.packages("tidyr")
install.packages("qdap")
install.packages("Rcpp")



library(tm) #Load the required packages
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(dplyr)
library(tidytext)
library(tokenizers)
library(NLP)
library(readr)
library(tidyr)
library(qdap)
library(Rcpp)

TR <- readLines(file.choose()) #Import the text file
turkey <- Corpus(VectorSource(TR)) #Load the text file as a corpus


inspect(turkey) #Inspect the content

#Cleaning the text

turkey <- tm_map(turkey, content_transformer(tolower)) #Convert the text to lower case 
turkey_tdm <- TermDocumentMatrix(turkey) #To avoid possible errors, run this code
turkey <- tm_map(turkey, removeNumbers) #Remove numbers
turkey_tdm <- TermDocumentMatrix(turkey) #To avoid possible errors, run this code
turkey <- tm_map(turkey, removeWords, stopwords("english")) #Remove common English stopwords
turkey_tdm <- TermDocumentMatrix(turkey) #To avoid possible errors, run this code
turkey <- tm_map(turkey, removePunctuation) #Remove punctuation
turkey_tdm <- TermDocumentMatrix(turkey) #To avoid possible errors, run this code


inspect(turkey) #Inspect the document content

#Build a Term Document Matrix

turkey_tdm <- TermDocumentMatrix(turkey) 
m <- as.matrix(turkey_tdm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)


head(d, 10)

#Clean the text by removing several meaningless words

turkey <- tm_map(turkey, removeWords, c("will", "years", "also"))

turkey_tdm <- TermDocumentMatrix(turkey) 
m <- as.matrix(turkey_tdm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)


head(d, 10)

#Cleaning

turkey <- tm_map(turkey, removeWords, c("syria"))

turkey_tdm <- TermDocumentMatrix(turkey) 
m <- as.matrix(turkey_tdm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)


head(d, 10)

#Cleaning

turkey <- tm_map(turkey, removeWords, c("billion", "country"))

turkey_tdm <- TermDocumentMatrix(turkey) 
m <- as.matrix(turkey_tdm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)


head(d, 10)

#Cleaning

turkey <- tm_map(turkey, removeWords, c("brothers"))

turkey_tdm <- TermDocumentMatrix(turkey) 
m <- as.matrix(turkey_tdm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)


head(d, 10)


#Generate the Word Cloud

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 100, random.order = FALSE, rot.per = 0.35, colors = brewer.pal(8, "Dark2"))

#Find frequent terms and the associations 

findFreqTerms(turkey_tdm, lowfreq = 4)

findAssocs(turkey_tdm, terms = "turkey", corlimit = 0.3)

head(d, 10)

#Plot word frequencies

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word, col = "blue", main = "Most Frequent Words - Recep Tayyip Erdogan", ylab = "Word Frequencies", cex.names = 0.75)

