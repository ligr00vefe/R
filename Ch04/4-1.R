# 날짜 : 2020/08/03
# 이름 : 권기민
# 내용 : 제어문과 함수 교재 p113

# 조건문
num1 <- 1
num2 <- 2
num3 <- 3

if(num1 < num2) {
  print('num1은 num2보다 작다.')
}

if(num2 > num3) {
  print('num2은 num3보다 크다.')
}else {
  print('num2은 num3보다 작다.')
}

result <- ifelse(num1 > num3, 'num1이 num3보다 크다.','num1이 num3보다 작다.')
result

# 반복문
for(i in 1:5){
  print(i)
}

# 1부터 10까지 합
sum <- 0
for(k in 1: 10) {
  sum <- sum + k
}

sprintf('1부터 10까지 합: %d', sum)

# while
k <- 1
total <- 0

while(k <= 10) {
  total <- total + k
  k <- k + 1
}

sprintf('total 값 : %d', total)


# 피타고라스 식
pytha <- function(s, t) {
  a <- s^2 - t^2
  b <- 2 * s * t
  c <- s^2 + t^2
  cat("피타고라스 정리 : 3개의 변수 : ", a, b, c)
}

pytha(2, 1)   # s, t의 인수는 양의 정수를 갖는다.


# 구구단
gugu <- function(i, j) {
  for(x in i) {
    cat('**', x, "단 **\n")
    for(y in j) {
      cat(x, "*", y, "=", x*y, "\n")
    }
    cat("\n")
  }
}
i <- c(2:9) # 단 수 지정
j <- c(1:9) # 단 수와 곱해지는 수 지정

# 구구단 함수 호출
gugu(i, j) # 구구단 보기
   

