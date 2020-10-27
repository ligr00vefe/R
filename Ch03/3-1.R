# 날짜 : 2020/08/04
# 이름 : 권기민
# 내용 : CSV 파일 데이터프레임 생성

df_exam <- read.csv('../file/exam.csv')

# View() - 데이터프레임 테이블로 출력
View(df_exam)

# head(), tail() - 상위, 하위 6개 데이터 미리보기
head(df_exam, 10)
tail(df_exam)

# dim() - 데이터프레임 구조 확인(차수 확인)
dim(df_exam)
# 20(행) 5(열)

# str() - 데이터프레임 속성 확인
str(df_exam)

# summary() - 데이터프레임 요약 통계
summary(df_exam)