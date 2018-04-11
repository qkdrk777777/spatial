library(sp)

#(1)
la<-c(37.5124500,37.4781547,37.4837493,37.5104969,37.5142013,37.5638433,37.5325270,
      37.5634557,37.5386167,37.5295204)
lo=c(126.9395002,126.9514850,127.0325954,127.0452259,127.1066864,126.9976021,126.9904904,
     127.0368207,127.0823747,127.1234640)
ll=data.frame(longitude=lo,latitude=la)
cs=CRS('+proj=longlat +datum=WGS84')
ll.sp=SpatialPoints(ll,proj4string=cs)
name=c('동작구청','관악구청','서초구청','강남구청','송파구청','중구청','용산구청','성동구청','광진구청','강동구청')
ll.sp
round(spDists(ll.sp),2)

#(2)
library(rgdal)
cs2=CRS('+proj=utm +zone=51 +ellps=WGS84 +units=km')
ll.sp2=spTransform(ll.sp,cs2)
ll.sp2
round(dist(data.frame(ll.sp2),method='euclidean'),3)
round(dist(data.frame(ll.sp2),method='manhattan'),3)

#(3)


library(sp)
la=c(37.5124500,37.5059546,37.4964553,37.4958369,37.4900359,37.4823951,37.4812365,37.4781547)
lo=c(126.9395002,126.9403928,126.9405994,126.9413620,126.9450080,126.9465463,126.9526738,126.9514850)
ll=data.frame(longitude=lo,latitude=la)
cs=CRS("+proj=longlat +datum=WGS84")
ll.sp=SpatialPoints(ll,proj4string = cs)
library(rgdal)
cs2=CRS('+proj=utm +zone=51 +ellps=WGS84 +units=km')
ll.sp2=spTransform(ll.sp,cs2)
ll=data.frame(ll.sp2)
ss=Line(ll)
LineLength(ss)

#12)
library(openxlsx)
setwd('C:/Users/qkdrk/Desktop/수업자료/지리공간정보_자료분석_엑셀자료')
dd3<-read.xlsx('제3장(3-4).xlsx')
dd3$`2010`
dd3$Name

#(3)
library(maptools)
library(TeachingDemos)
setwd('C:/Users/qkdrk/Desktop/수업자료/지리공간정보_자료분석_엑셀자료')
dd3<-read.xlsx('제3장(3-4).xlsx')
dd3$`2010`
dd3$Name
setwd('C:/Users/qkdrk/Desktop/aa')
sp=readShapePoly('aa.shp')
#추가한거
setequal(t@data$SIG_KOR_NM,dd3$Name)
sp@data<-merge(sp@data,dd3,by.x='SIG_KOR_NM',by.y='Name',all=T)
sp@data<-sp@data[order(as.numeric(as.character(sp@data$SP_ID))),]

sp@data
xa=coordinates(sp)[,1]
ya=coordinates(sp)[,2]
da=cbind(dd3$`2010`,dd3$`2014`)
dm=max(da)
cols=c(c('orange','cyan'))
plot(sp,cex.axis=1.2)
title('서울 자치구 재정자립도')
for(i in 1:length(xa)){
  subplot(barplot(da[i,1],ylim=c(0,dm),col=cols[1],yaxt='n'),x=xa[i]-500,y=ya[i]+1000,
          size=c(0.1,0.5),vadj=0)
}

text(coordinates(sp),labels=sp$SIG_KOR_NM,cex=0.5)
legend('bottomright',c('2010','2014'),bty='n',fill=cols,cex=0.8)


###추가



