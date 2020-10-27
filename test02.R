#test02
#R을 이용하여 iris 데이터의 상관분석을 수행하시오.

# library import
install.packages('corrplot')
install.packages('corrgram')

library(corrplot)
library(corrgram)

# iris 데이터 확인
View(iris)

# 불필요한 컬럼 제거(Species)
df_iris <- df_iris %>% select(-Species)
View(df_iris)

# 상관계수 행렬확인
cor(df_iris, method = 'pearson')

# 상관관계 시각화
pairs(df_iris)
corrgram(df_iris, lower.panel = panel.conf)

# 결과
# 1 또는 -1에 가까울수록 데이터간의 상관관계가 있음.
# 0에 가까운 값은 서로 상관관계가 희박함.

