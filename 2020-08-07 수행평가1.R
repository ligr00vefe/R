# 수행평가

# 패키지 설치 및 라이브러리 적용
install.packages('dplyr')
library(dplyr)

# exam.csv 파일의 Dataframe 생성
df_exam <- read.csv('./file/exam.csv')

# 결과확인
View(df_exam)


# Math, english, science 변수만 갖는 Dataframe 생성
df_math    <- df_exam %>% select(math)
df_english <- df_exam %>% select(english)
df_science <- df_exam %>% select(science)  

# 결과확인
df_math
df_english
df_science


# English가 60점 이상이고 80점 미만인 Dataframe 생성
df_task1 <- df_exam %>% filter(english >= 60 & english < 80)

# 결과확인
df_task1


# Class가 1인 모든 변수를 갖는 Dataframe 생성
df_task2 <- df_exam %>% select(everything()) %>% filter(class==1)

# 결과확인
df_task2


# math가 60점 이상이고 점수가 높은 순서를 갖는 class, id, math 변수를 갖는 Dataframe 생성
df_task3 <- df_exam %>% select(class, id, math) %>% filter(math >= 60) %>% arrange(desc(math))

# 결과확인
df_task3


# Class 로 그룹화되고 수학점수 평균(mean_math) 변수를 갖는 Dataframe 생성
df_task4 <- df_exam %>% group_by(class) %>% summarise(mean_math = mean(math))

# 결과확인
df_task4

