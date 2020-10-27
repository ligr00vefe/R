# 날짜 : 2020/08/05
# 이름 : 권기민
# 내용 : R MongoDB 연동

install.packages('mongolite')
library(mongolite)

remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
library(dplyr)
library(stringr)


conn <- mongolite::mongo(url='mongodb://chhak:1234@192.168.50.82:27017/chhak',
                         db='chhak',
                         collection='movies',
                         verbose = TRUE,
                         options = ssl_options())

df_movies <- conn$find()
View(df_movies)

# 형태소 분석을 위한 사전설정
useNIADic()

# 그린 북만
df_movies <- df_movies %>% filter(title=='그린 북')
View(df_movies)

# 리플만
df_movies <- df_movies %>% select(reple)
View(df_movies)

# 특수문자 제거
df_movies <- str_replace_all(df_movies, '\\W', ' ')
View(df_movies)

# 명사 추출
df_movies <- extractNoun(df_movies)
View(df_movies)

# 명사 단어 집계
word_count <- table(unlist(df_movies))
View(word_count)

# 데이터프레임으로 변환
df_word <- as.data.frame(word_count, stringsAsFactors = F)
View(df_word)

# 두 문자 이상 단어만 추출(결측값 제거)
df_word <- df_word %>% filter(nchar(Var1) >= 2) %>% filter(!is.na(Var1))
View(df_word)

# 워드클라우드 출력
install.packages('wordcloud')
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8, 'Dark2')
set.seed(1)

wordcloud(words = df_word$Var1,
          freq = df_word$Freq,
          min.freq = 9,
          max.words = 1000,
          random.order = F,
          rot.per = 0.7,
          scale = c(4, 0.3),
          colors = pal)
