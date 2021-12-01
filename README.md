# 2020-President-Erdogan-Speeches-Analysis
#Upload necessary packages to run this code:
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

#Upload txt document (turkey) This includes 2020 Speeches of President Erdogan related to foreign policy
turkey <- read_lines("C:/Users/iremb/Desktop/turkey.txt")
read_lines(turkey)
#Code
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
#When you run the code, you should get this result:
## A tibble: 11 x 2
   word          count
   <chr>         <dbl>
 1 ""             4275
 2 "support"        21
 3 "rights"         19
 4 "cooperation"    17
 5 "peace"          15
 6 "terrorism"      13
 7 "gas"            12
 8 "investment"     11
 9 "security"       11
10 "energy"         10
11 "interests"       9
