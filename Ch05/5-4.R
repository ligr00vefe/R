# 날짜 : 2020/08/04
# 이름 : 권기민
# 내용 : 데이터 시각화 - 기타 그래프 교재 p237

library(ggplot2)

# 산점도
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point(aes(colour = Species))

# 라인그래프
View(economics)
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# 박스플롯
View(mpg)
summary(mpg)
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

# 히스토그램 - 막대그래프는 이산값, 히스토그램은 연속성을 갖는 데이터를 출력하는 막대그래프
View(iris)
hist(iris$Sepal.Width,
     xlim = c(2.0, 4.5),
     xlab = '꽃받침 길이',
     col  = 'orange',
     freq = F,
     main = '꽃받침 길이 분포도 ')

# 정규분포 라인(가우시안 분포)
lines(density(iris$Sepal.Width), col="blue")
