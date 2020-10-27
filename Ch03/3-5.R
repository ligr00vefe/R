# 날짜 : 2020/08/04
# 이름 : 권기민
# 내용 : dplyr 패키지 연습문제

View(iris)


df_result <- iris %>% group_by(Species) %>% 
                      summarise(mean(Sepal.Length),
                                mean(Sepal.width),
                                mean(Petal.Length),
                                mean(Petal.Width))
df_result
