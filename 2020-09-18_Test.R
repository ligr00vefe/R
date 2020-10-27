#iris 회귀분석

#데이터 불러오기
attach(iris)
df_iris <- iris[, -5]
View(df_iris)

#다중 선형 회귀
result <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width)

#회귀모형 요약
summary(result)



#iris 주성분 분석

#라이브러리 설치 및 불러오기
install.packages("devtools")
library(devtools)
install_github("vqv/ggbiplot")
library(ggbiplot)


#데이터 준비

#연속형 변수
df_iris <- iris[, -5]
#범주형 변수
df_name <- iris[, 5]

#주성분분석 실행
df_pca <- prcomp(df_iris, center = T, scale. = T)

#결과확인
df_pca

#주성분 분석 시각화(Proportion of variance 출력)
plot(df_pca, type = "lines")

#요약확인
summary(df_pca)

#ggbiplot 시각화
iris_gg <- ggbiplot(df_pca, 
                    choices = c(1, 2),
                    obs.scale = 1,
                    var.scale = 1,
                    groups = df_name,
                    ellipse = TRUE,
                    circle = TRUE)
iris_gg <- iris_gg + scale_color_discrete(name = '')
iris_gg <- iris_gg + theme(legend.direction = 'horizontal',
                           legend.position = 'top')

#그래프 확인
print(iris_gg)

