# a. Preparing data for word cloud
library("tm")

course_corpus = VCorpus(DirSource("//students.uce.ac.uk/filespace/mb20/tic/S23206188/DataMiningProjects/wordcloud_project/text-analytics/courses"))

course_corpus2 = tm_map(course_corpus, content_transformer(tolower))

course_corpus3 = tm_map(course_corpus2, removePunctuation)

course_corpus4 = tm_map(course_corpus3, removeWords, stopwords())

course_dtm <- DocumentTermMatrix(course_corpus4)

inspect(course_dtm)

word_frequency <- sort(colSums(as.matrix(course_dtm)),decreasing=TRUE)
df_frequency<- data.frame(word = names(word_frequency),freq=word_frequency)

head(df_frequency)

# b. Displaying the Word Cloud
library("wordcloud")

wordcloud(df_frequency$word,df_frequency$freq)

wordcloud(df_frequency$word, df_frequency$freq, max.words=10, min.freq = 1)

# c. Enhancing the Word Cloud
wordcloud(df_frequency$word, df_frequency$freq, max.words=10, min.freq = 1,
          random.order=FALSE,family = "Helvatica", font = 3)

library("RColorBrewer")

word_pal <- brewer.pal(10,"Dark2")

wordcloud(df_frequency$word,df_frequency$freq, max.words=20, min.freq = 1, random.order=FALSE, colors=word_pal, font = 3)

