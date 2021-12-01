#Same packages
install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("readr")
install.packages("NLP")
install.packages("tokenizers")



library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("readr")
library("NLP")
library("tokenizers")

turkey <- read_lines("C:/Users/iremb/Desktop/turkey.txt")
read_lines(turkey)


turkeytidy <- paste0(turkey, collapse = " ")
turkeytidy <- tibble(turkeytidy)
str(turkeytidy)

turkeytidy <- Corpus(VectorSource(turkeytidy))
words <- tokenize_words(turkeytidy)

length(words)

all_stops <- c("turkey", "countries", "country", "turkish",
               "will", "hundred", "one", "thousand",
               "international", "two", "years",
               "five", "also", "people", "world",
               "point", "four", "billion", "syria", "fight", 
               "region", "twenty", "especially", "mediterranean",
               "provide", "sisters", "brothers", "organizations",
               "continue", "eastern", "six", "pakistan",
               "dollar", "three", "first", "important",
               "like", "pandemic", "natural", "see",
               "thirty", "citizens", "efforts", "issue", "terrorist", 
               "never", "political", "turkeys", "us", 
               "african", "eight", "forty", "iraq", 
               "without", "believe", "companies", "conflict", "cubic", "europe", 
               "foreign", stopwords("en"))

tab <- table(words)
tab <- table(removeWords(words[[1]],all_stops))
tab <- tibble(word = names(tab), count = as.numeric(tab))
tab <- arrange(tab, desc(count))
tab


head(tab,11)
