# 날짜 : 2020/08/04
# 이름 : 권기민
# 내용 : dplyr 패키지 실습하기

# 패키지 설치 및 라이브러리 적용
install.packages('dplyr')
library(dplyr)

# exam.csv 파일의 Dataframe 생성
df_exam <- read.csv('./file/exam.csv')
View(df_exam)


# select - Dataframe의 특정 컬럼을 선택해서 새로운 Dataframe 생성
df_math    <- df_exam %>% select(math)
df_english <- df_exam %>% select(english)
df1        <- df_exam %>% select(math, science)
df2        <- df_exam %>% select(everything())   
# everything: sql의 *과 같은 뜻

df_math
df_english
df1
df2

# filter(sql의 where) - DF의 특정 조건에 맞는 컬럼을 선택해서 새로운 Dataframe 생성
df_class1 <- df_exam %>% filter(class==1)
df_class1

# 영어점수 60점이상 80점미만


# 과학점수 60점이상 80점미만
df_science <- df_exam %>% filter(science >= 60 & science < 80)
df_science

# SELECT math FROM df_exam WHERE class=1
df_math <- df_exam %>% filter(class==1) %>% select(math)
df_math

# SELECT * FROM df_exam WHERE math > 60 AND math < 80
df_all <- df_exam %>% select(everything()) %>% filter(math > 60 & math < 80)
df_all


# arrange(sql의 order by) - Dataframe의 특정 컬럼을 정렬해서 새로운 Dataframe 생성
df_math_asc <- df_exam %>% arrange(math)
df_math_desc <- df_exam %>% arrange(desc(math))
df_math_asc
df_math_desc

# SELECT class, id, math FROM df_exam WHERE math >= 60 ORDER BY math DESC LIMIT 3;
df_result <- df_exam %>% select(class, id, math) %>% 
                         filter(math >= 60) %>% 
                         arrange(desc(math)) %>% 
                         head(3)
df_result

# mutate 파생변수 추가하기 - Dataframe의 새로운 특정 컬럼(파생변수)을 추가해서 새로운 Dataframe 생성
df_total <- df_exam %>% mutate(total = math+english+science)
df_total

df_mean <- df_total %>% mutate(mean = total/3) 
df_mean 

df_grade <- df_mean %>% mutate(grade = ifelse(mean >= 90, 'A',
                                       ifelse(mean >= 80, 'B', 
                                       ifelse(mean >= 70, 'C', 
                                       ifelse(mean >= 60, 'D',  'F')))))
df_grade

# summarise 집계조건 - Dataframe의 특정 컬럼에 대한 요약통계
df_exam %>% summarise(mean_math=mean(math))
df_exam %>% summarise(mean_math=sum(math))

# group_by 집단별 요약(집계조건이 필요) - Dataframe의 특정 컬럼에 대해 그룹화
df_group1 <- df_exam %>% group_by(class) %>% summarise(sum_math = sum(math))
df_group1

df_group2 <- df_exam %>% group_by(class) %>% summarise(mean_math = mean(math))
df_group2

# inner_join - 두 개 이상의 Dataframe의 공통 컬럼으로 조인
df_teacher <- data.frame(class=c(1, 2, 3, 4, 5),
                         teacher=c('김유신', '김춘추', '장보고', '강감찬', '이순신'))
df_teacher

df_join <- inner_join(df_exam, df_teacher, by='class')
df_join
