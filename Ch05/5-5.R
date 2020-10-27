# 날짜 : 2020/08/05
# 이름 : 권기민
# 내용 : 데이터 시각화 - 지도 그래프 교재 p290

install.packages('devtools')
devtools::install_github('dkahle/ggmap')
library('ggmap')

register_google(key = 'AIzaSyBrkMiFk4KP89zVAkrefQdzTiiGAucTcAY')

# 서울의 위치정보 구하기
gcs <- geocode("seoul")
gcs
gcb <- geocode("busan")
gcb

seoul <- as.numeric(gcs)
busan <- as.numeric(gcb)

# 지도 출력
maps <- get_googlemap(center = seoul,
                     language = 'ko-KR',
                     color = 'bw',
                     zoom = 15)

mapb <- get_googlemap(center = busan,
                     language = 'ko-KR',
                     color = 'bw',
                     zoom = 15)

ggmap(maps, extend = 'device')
ggmap(mapb, extend = 'device')
