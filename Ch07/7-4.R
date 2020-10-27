# 날짜 : 2020/08/06
# 이름 : 권기민
# 내용 : R 데이터분석 회귀분석 실습하기 

df_product <- read.csv('./file/product.csv')

# 독립젼수와 종속변수 생성
x <- df_product$제품_적절성
y <- df_product$제품_만족도

df_xy <- data.frame(x, y)
View(df_xy)

# 단순 선형 회귀 모델생성
result_lm <- lm(formula = y~x, data = df_xy)
result_lm

# 회귀식(x값은 독립변수를 사용)
simple_linear <- function(x){
  y <- 0.7393 * x + 0.7789
  return(y)
}

# 예측(simple_linear()의 매개 변수가 적절성이면 y1은 만족도가 됨)
y1 <- simple_linear(1)
y2 <- simple_linear(2)
y3 <- simple_linear(3)
y4 <- simple_linear(4)
y5 <- simple_linear(5)

y1
y2
y3
y4
y5

# y1 결과 - 적절성(simple_linear)이 1점이면 만족도(y1)는 1.5182점
# y5 결과 - 적절성(simple_linear)이 5점이면 만족도(y1)는 4.4754점


# 다중선형회귀 분석
y <- df_product$제품_만족도   # 종속변수
x1 <- df_product$제품_친밀도  # 독립변수
x2 <- df_product$제품_적절성  # 독립변수

df_xxy <- data.frame(x1, x2, y)
View(df_xxy)

# 다중선형회귀 모델 생성
result_lm <- lm(formula = y ~ x1 + x2, data = df_xxy)
result_lm
# Intercept(절편)

# 회귀식
multi_linear <- function(x1, x2) {
  y <- 0.09593 * x1 + 0.68522 * x2 + 0.66731
  return(y)
}
multi_linear(1, 2)
# 친밀도가 1점이고 적절성이 2점이면 만족도는 2.13368이 나온다

r1 <- multi_linear(1, 2)
r2 <- multi_linear(2, 3)
r3 <- multi_linear(3, 4)
r4 <- multi_linear(4, 5)
r5 <- multi_linear(5, 5)

r1
r2
r3
r4
r5

# galton 데이터 회귀분석 실습
install.packages('UsingR')
library(UsingR)

data(galton)
View(galton)

result_galton = lm(galton$child ~ galton$parent, data = galton)
result_galton

# 시각화
plot(galton$child ~ galton$parent, data = galton)
abline(result_galton, col='red')
