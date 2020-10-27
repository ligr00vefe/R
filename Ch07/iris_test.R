# iris TEST

# 패키지 설치 및 라이브러리 적용
install.packages('dplyr')
install.packages('corrplot')
install.packages('corrgram')
library(dplyr)
library(corrplot)
library(corrgram)

# 붓꽃(iris) 확인
View(iris)


# 불필요한 컬럼 제거(Species)
df_iris <- iris %>% select(-Species)

# 결과확인
View(df_iris)


# 변수간 상관계수 확인
cor(df_iris$Sepal.Length, df_iris$Petal.Length)
cor(df_iris$Sepal.Length, df_iris$Sepal.Width)
cor(df_iris$Sepal.Length, df_iris$Petal.Width)
cor(df_iris$Petal.Length, df_iris$Petal.Width)
cor(df_iris$Petal.Length, df_iris$Sepal.Width)
cor(df_iris$Petal.Width,  df_iris$Sepal.Width)



# 상관계수 행렬화
cor(df_iris, method = 'pearson')


# 상관관계 시각화
pairs(df_iris)
corrgram(df_iris, lower.panel = panel.conf)
