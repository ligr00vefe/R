#test01

# library import
install.packages('dplyr')
library(dplyr)

df_exam <- read.csv('./file/exam.csv')
View(df_exam)

#math, english, science만 갖는 dataframe 생성
df_math <- df_exam %>% select(math)
df_english <- df_exam %>% select(english)
df_science <- df_exam %>% select(science)

#데이터 확인
df_math
df_english
df_science

#english가 60점 이상이고 80점 미만 dataframe 생성
df_english60_80 <- df_exam %>% filter(english >= 60 & english < 80)
df_english60_80

# SELECT math FROM df_exam WHERE class=1
df_all <- df_exam %>% select(everything()) %>% filter(class==1)
df_all

# math가 60점 이상이고 점수가 높은 순서를 갖는 class, id, math 변수를 갖는 dataframe 생성
df_math60 <- df_exam %>% select(everything()) %>% filter(math > 60) %>% arrange(desc(math))
df_math60

# class로 그룹화되고 수학점수 평균(mean_math) 변수를 갖는 dataframe 생성
math <- df_exam %>% group_by(class) %>% summarise(mean_math = mean(math))
math
