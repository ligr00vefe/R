#필요한 패키지 설치
install.packages("DBI")
install.packages("rJava")
install.packages("RJDBC")
install.packages("log4r")

#설치한 패키지 로드
library("DBI")
library("rJava")
library("RJDBC")

#R과 Hive 연동을 위한 R클래스 path 설정
hive.class.path = list.files(path=c("/lib"), pattern="jar", full.names=T);
hadoop.lib.path = list.files(path=c("/lib"), pattern="jar", full.names=T);
hadoop.class.path = list.files(path=c("/lib"), pattern="jar", full.names=T);
class.path = c(hive.class.path, hadoop.lib.path, hadoop.class.path);
.jinit(classpath=class.path)

#하이브 JDBC 로드
drv <- JDBC("org.apache.hive.jdbc.HiveDriver",
            "./lib/hive-jdbc-2.1.1-cdh6.3.2.jar",
            identifier.quote = "`")

#하이브 접속
conn <- dbConnect(drv,
                  "jdbc:hive2://192.168.100.201:10000/default",
                  "hive",
                  "1234")

#하이브 테이블 목록 조회
dbListTables(conn);

#SmartCar_Master2Income 테이블 조회
data <- dbGetQuery(conn, "select * from `smartcar_master2income`")
View(data)

#data$smartcar_master2income.income <- gsub("income", "", data$smartcar_master2income.income)
#data$smartcar_master2income.income <- as.numeric(data$smartcar_master2income.income) 

#data$smartcar_master2income.car_year <- gsub("year", "", data$smartcar_master2income.car_year)
#data$smartcar_master2income.car_year <- as.numeric(data$smartcar_master2income.car_year)

#data$smartcar_master2income.car_model <- gsub("type", "", data$smartcar_master2income.car_model)
#data$smartcar_master2income.car_model <- as.numeric(data$smartcar_master2income.car_model)

#data$smartcar_master2income.car_capacity <- gsub("capacity", "", data$smartcar_master2income.car_capacity)
#data$smartcar_master2income.car_capacity <- as.numeric(data$smartcar_master2income.car_capacity) 

#조회한 테이블 데이터 시각화 파악
hist(data$smartcar_master2income.income)

#스마트카의 배기량에 따른 운전자의 연소독 예측 회귀모델 생성및 요약
model <- lm(data$smartcar_master2income.income ~ smartcar_master2income.car_capacity,
            data=data)

summary(model)

#회귀모델 테스트 확인
text_data <- read.csv("./file/CarMaster2Income_Test.txt",
                      sep="|",
                      header=T,
                      encoding="UTF-8")

predict(model, text_data, interval = "prediction")
