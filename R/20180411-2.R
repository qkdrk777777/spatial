#8
library(sp)
library(RgoogleMaps)
library(plotGoogleMaps)

na<-c('seoul','incheon','goyang','yijeongbu','namyangju','seongnam','anyang')
lo=rep(0,length(na))
la=rep(0,length(na))
for(i in 1:length(na)){
  la[i]<-getGeoCode(na[i])['lat']
  lo[i]<-getGeoCode(na[i])['lon']
  Sys.sleep(2)
}
(ddd1<-data.frame(na,lo,la,sym=c(8,6,5,3,3,4,3)))
coordinates(ddd1)<-~lo+la
ddd1@proj4string =CRS('+proj=longlat +datum=WGS84')
bb=bubbleSP(ddd1,zcol=c('sym'),max.radius=5000)
pal<-colorRampPalette(c('#FFF7BC','#FEC44F','#D95F0E'),space='Lab')
m1=plotGoogleMaps(bb,zcol='sym',colPalette=pal(5),control.width='50%',control.height='50%'
api='')


#9
library(RgoogleMaps)
library(plotGoogleMaps)
name=c('seoul','incheon','goyang','yuijeongnbu','namyangju','paju')
lo=rep(0,length(name))
la=rep(0,length(name))
for(i in 1:length(name)){
  la[i]=getGeoCode(name[i])['lat']
  lo[i]=getGeoCode(name[i])['lon']

}

(ddd2<-data.frame(name , lo, la, q1=c(8,6,5,5,4,3),q2=c(8,4,5,3,3,4)))
coordinates(ddd2)<-~lo+la
ddd2@proj4string=CRS('+proj=longlat+ datum=WGS84')
m2<-segmentGoogleMaps(ddd2,zcol=c('q1','q2'),mapTypeId='ROADMAP',max.radius=5000,
                      colPalette=c('red','green'),strokeColor='black',control.width='80%'
                      ,control.height='80%')

#10
library(RgoogleMaps)
library(plotGoogleMaps)
dd=matrix(c(1,37.532054,126.993713,210,
            2, 37.568528,127.021179,150,3,37.650665,127.043152,110,
            4,37.60444,127.084351,125,5,37.539133,127.075424,141,
            6,37.550021,127.129669,131,7,37.516806,127.101517,193,
            8,37.520935,127.086243,171,9,37.522797,127.041092,262,
            10,37.498287,127.016373,247,11,37.481397,126.949768,175,
            12,37.512449,126.924362,143,13,37.575603,126.914063,129,
            14,37.639247,126.934662,108,15,37.497197,126.890717,128,
            16,37.522797,126.846085,118,17,37.560908,126.791153,103,
            18,37.524975,126.927795,193),nc=4,byrow=T)
ddd3<-data.frame(dd)
coordinates(ddd3)<-~X3+X2
ddd3@proj4string=CRS('+proj=lonlat+datum=WGS84')
m3<-mcGoogleMaps(ddd3,zcol='X4',mapTypeId='ROADMAP',control.width='80%',control.height='80%')

#11
library(RgoogleMaps)
g1=getGeoCode('Seoul cityhall,Seoul, Korea')
g2=getGeoCode('Incheon cityhall, Incheon, Korea')
lat=c(g1[1],g2[1])
lon=c(g1[2],g2[2])
center=c(mean(lat),mean(lon));
zoom<-min(MaxZoom(range(lat),range(lon)))
MyMap7<-GetMap(center=center,zoom=zoom)
PlotOnStaticMap(MyMap7,lat=lat,lon=lon, cex=2,pch=20,col=c('red','red'),add=F);
PlotOnStaticMap(MyMap7,lat=c(g1[1],g2[1]),lon=c(g1[2],g2[2]),lwd=2,col=c('red'),FUN=lines,add=T)
library(sp)
ll=data.frame(longitude=lon,latitude=lat)
cs=CRS('+proj=longlat+datum=WGS84')
ll.sp=SpatialPoints(ll,proj4string=cs)
dis=round(spDists(ll.sp),2)
for(i in 1:7){PlotOnStaticMap(MyMap7,lat=g1[1],lon=g1[2],cex=i*7,pch=21,col=2,add=T,lwd=8-i)}
for(i in 1:7){PlotOnStaticMap(MyMap7,lat=g2[1],lon=g2[2],cex=i*7,pch=21,col=2,add=T,lwd=8-i)}
text(0,0,paste('서울-인천 직선 거리= ',dis[1,2],'km'),font=2)
