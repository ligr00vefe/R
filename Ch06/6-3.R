# 날짜 : 2020/08/05
# 이름 : 권기민
# 내용 : R Hadoop 연동

devtools::install_github(c("saurfang/rwebhdfs"))
library(rwebhdfs)

hdfs <- webhdfs('192.168.100.101', 50070, 'root')

df_hd_sales2017 <- read_file(hdfs, '/sample/sales2017.csv')

View(df_hd_sales2017)
