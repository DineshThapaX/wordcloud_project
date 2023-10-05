**Word Cloud using R Programming**

A word cloud is a visual representation of a collection of words.

Word clouds (also known as text clouds or tag clouds) work in a simple way: the more a specific word appears in a source of textual data (such as a speech, blog post, or database), the bigger and bolder it appears in the word cloud.

Benefits of Using Word Cloud Analysis

1.  Finding customer pain points --- and opportunities to connect.
2.  Finding customer pain points --- and opportunities to connect.
3.  Finding customer pain points --- and opportunities to connect.

**Word Cloud using R Programming Tutorial Step by Step**

I assume that you already have latest version of R and RStudio installed on your PC. Please do follow all the steps to understand how Word Cloud is build using R Programming and its packages.

**Step 1: First of all, Download or Clone my Github Repo.**

<https://github.com/DineshThapaX/wordcloud_project>

**Step 2: my.R is the source file of the project.**

Please install "tm" package on your RStudio using Console. That is essential for our project. You can also download it manually from packages section.

```{r}
install.packages ("tm")
```

"tm" package in R is the Text Mining package. The "tm" package offers functionality for managing text documents, abstracts the process of document manipulation and eases the usage of heterogeneous text formats in R.

**Step 3:** **Follow and read all the texts without skipping.**

my.R is my source file. For your practice, please create your own source file named "test.R" in your working directory.

**We will solve this problem in three major steps.**

**a. Preparing data for word**

**b. Displaying the Word Cloud**

**c. Enhancing the Word Cloud**

**a. Preparing data for word cloud**

**a1. Create a corpos object using VCorpus class.**

First of all, Load "tm" package in your source code.

```{r}
library("tm")
```

Creating a course_corpus object from Vcorpus class.

```{r}
course_corpus = VCorpus(DirSource("//students.uce.ac.uk/filespace/mb20/tic/S23206188/DataMiningProjects/wordcloud_project/text-analytics/courses"))

```

To know more about the corpus, follow this:-

<https://rdrr.io/rforge/tm/man/Corpus.html>

In the above code, VCorpus creates a object and stores the content of my texts data from courses folder in the course_corpus variable.

In your case, please provide your own directory source.

**a2. Convert texts data to lower case**

```{r}
course_corpus2 = tm_map(course_corpus, content_transformer(tolower))
```

The tm_map () function is used to remove unnecessary white space, to convert the text to lower case, to remove common stopwords like 'the', "we".

**a3. Remove punctuations**

```{r}
course_corpus3 = tm_map(course_corpus2, removePunctuation)

```

**a4. Remove stopwords**

```{r}
course_corpus4 = tm_map(course_corpus3, removeWords, stopwords())

```

**a5. Generate TF-IDF matrix** Term Document/Inverse Document Frequency(TF-IDF) is a powerful text analysis technique to find similar documents based their vector representations.

```{r}
course_dtm <- DocumentTermMatrix(course_corpus4)

```

**a6. Inspect to TF-IDF**

```{r}
inspect(course_dtm)
```

In R, the inspect() function is used to print the internal representation of an R object or the result of an expression. The inspect() function is also used to track the executed code lines of a function or method.

**a7. Generate a frequency data frame**

```{r}
word_frequency <- sort(colSums(as.matrix(course_dtm)),decreasing=TRUE)
df_frequency<- data.frame(word = names(word_frequency),freq=word_frequency)

```

**a8. Display the first few rows of the data**

The head () function in R is used to display the first n rows or elements of a vector, matrix, table, data frame or function.

```{r}
head(df_frequency)
```

**b. Displaying the Word Cloud**

**b1. First of all, Install "wordcloud" package. Then, copy the below code step by step.**

```{r}
library("wordcloud")
```

**b2. Simple wordcloud**

```{r}
wordcloud(df_frequency$word,df_frequency$freq)
```

**b3. Displaying Top 10 words in wordcloud**

```{r}
wordcloud(df_frequency$word, df_frequency$freq, max.words=10, min.freq = 1)
```

**c. Enhancing the Word Cloud**

**c1. Choose a specific font and order**

```{r}
wordcloud(df_frequency$word, df_frequency$freq, max.words=10, min.freq = 1,
          random.order=FALSE,family = "Helvatica", font = 3)
```

**c2. Using a color palatte. First of all install "RColorBrewer" package.**

```{r}
library("RColorBrewer")

word_pal <- brewer.pal(10,"Dark2")

wordcloud(df_frequency$word,df_frequency$freq, max.words=20, min.freq = 1, random.order=FALSE, colors=word_pal, font = 3)
```

**Congratulations! You have created an awesome project Word Cloud using R programming.**
