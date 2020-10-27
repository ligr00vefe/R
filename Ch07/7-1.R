# 날짜 : 2020/08/06
# 이름 : 권기민
# 내용 : R 데이터분석 실습하기

library(dplyr)
library(plyr)
library(ggplot2)

-
df_busan <- read.csv('./file/busan.csv')
# View(df_busan)

# 한글 컬럼 영문으로 변경
df_busan <- df_busan %>% rename('region'='행정구역별', 'item'='항목')
# View(df_busan)

# 출생건수 데이터만 집계(부산광역시 항목 제거, 아이템 항목 제거)
df_busan_birth <- df_busan %>% filter(item=='출생건수 (명)' & region != '부산광역시') %>% select(-item)
# View(df_busan_birth)

# df_busan_birth 데이터프레임으로부터 새로운 구조의 데이터프레임 생성(cha)
df_new_busan <- data.frame(region=character(), 
                           years=numeric(), 
                           birth=numeric(),
                           stringsAsFactors = FALSE) 
# 변수에 문자가 있으면 자동으로 연산이 되지 않는 factor타입으로 변환된다.
# factor타입을 false로 해줘야 factor타입이 되지 않음.

for(n in 1:nrow(df_busan_birth)) {
    
  region <- df_busan_birth[n, 'region']
  year <- 2000
  
  for(col in colnames(df_busan_birth)) {
      birth <- df_busan_birth[n, col]
      
      if(col != 'region') {
        row <- c(region, year, birth)
        df_new_busan <- rbind(df_new_busan, row)
        
        year <- year + 1
      }
  }

}

# View(df_new_busan)

# 컬럼명 다시 수정
names(df_new_busan) <- c('region', 'years', 'birth')
View(df_new_busan)

# 상태 확인
str(df_new_busan)

# 문자열 숫자로 변환
df_new_busan$birth <- as.numeric(df_new_busan$birth)

df_new_busan$years <- as.numeric(df_new_busan$years)

str(df_new_busan)

# 데이터 시각화
ggplot(data=df_new_busan, aes(x=years, y=birth)) + geom_line(aes(color=region))

ggplot(df_new_busan, aes(x=years, y=birth, color=region)) + geom_line()
