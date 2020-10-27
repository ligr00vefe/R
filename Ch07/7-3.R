# 날짜 : 2020/08/06
# 이름 : 권기민
# 내용 : R 데이터분석 상관분석 실습하기

install.packages('corrplot')
install.packages('corrgram')

library(corrplot)
library(corrgram)

df_product <- read.csv('./file/product.csv')
View(df_product)

# 변수간 상관계수 확인
cor(df_product$제품_친밀도, df_product$제품_적절성)
cor(df_product$제품_친밀도, df_product$제품_만족도)
cor(df_product$제품_적절성, df_product$제품_만족도)

# 상관계수 행렬
cor(df_product, method = 'pearson')

# 상관관계 시각화
pairs(df_product)
corrgram(df_product, lower.panel = panel.conf)


# 도전 
# 붓꽃 데이터 상관분석
# 데이터 확인
View(iris)

# 불필요한 컬럼 제거(Species)
df_iris <- df_iris %>% select(-Species)

# 데이터 확인
View(df_iris)

# 변수간 상관계수 확인
cor(df_iris$Sepal.Length, df_iris$Sepal.Width)
cor(df_iris$Sepal.Length, df_iris$Petal.Length)
cor(df_iris$Sepal.Length, df_iris$Petal.Width)
cor(df_iris$Petal.Length, df_iris$Petal.Width)
cor(df_iris$Petal.Length, df_iris$Sepal.Length)
cor(df_iris$Petal.Length, df_iris$Sepal.Width)
cor(df_iris$Petal.Width, df_iris$Sepal.Width)

# 상관계수 행렬
cor(df_iris, method = 'pearson')

# 상관관계 시각화
pairs(df_iris)
corrgram(df_iris, lower.panel = panel.conf)

