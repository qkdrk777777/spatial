#14)
library(maptools)
library(lattice)
setwd('C:/Users/qkdrk/Desktop/aa')
sp=readShapePoly('aa.shp')
library(openxlsx)
setwd('C:/Users/qkdrk/Desktop/수업자료/지리공간정보_자료분석_엑셀자료')
dd4<-read.xlsx('제3장(3-5).xlsx')
sp@data$popt=dd4$`pop1.(14세.이하)`+dd4$`pop2.(15-64)`+dd4$`pop3.(65세.이상)`
sp@data$rr1=dd4$`pop1.(14세.이하)`/sp@data$popt
sp@data$rr2=dd4$`pop2.(15-64)`/sp@data$popt
sp@data$rr3=dd4$`pop3.(65세.이상)`/sp@data$popt
rate=equal.count(sp@data$rr3,number=4,overlap=1/5)
CCmaps(sp,'rr3',list('Rate'=rate),main='서울시 지역별 노령인구 비율',
       col.regions= colorRampPalette(c('yellow1','brown3'))(25))


#15)
library(maptools)
library(plotGoogleMaps)
data(meuse)
coordinates(meuse)<-~x+y
proj4string(meuse)<-CRS('+init=epsg:28992')

data(meuse.grid)
coordinates(meuse.grid)<-c('x','y')
meuse.grid<-as(meuse.grid,'SpatialPixelsDataFrame')
im<-as.image.SpatialGridDataFrame(meuse.grid['dist'])
cl<-ContourLines2SLDF(contourLines(im))
proj4string(cl)<-CRS('+init=epsg:28992')

mapMeuseCl<-plotGoogleMaps(cl,control.width='80%',control.height = '80%')

#16)
library(maptools)
str(volcano)
volcano[,1]
volcano[1,]
x<-20*1:nrow(volcano)
y<-20*1:ncol(volcano)
clv<-contourLines(x,y,volcano)
res<-ContourLines2SLDF(clv)

spplot(res,axes=T,col.regions=terrain.colors(nrow(as(res,'data.frame'))),
       main='Volcano Contours Type I:Spatial Lines')
grd<-GridTopology(c(0,0),c(20,20),dim(volcano))
alt<-data.frame(altitude=as.vector((volcano[,ncol(volcano):1])))
spvol<-SpatialGridDataFrame(grd,alt)
spplot(spvol,sp.layout=list(list('sp.lines',res)),col.regions=terrain.colors(16),
       main='Volcano Contours Type II:Spatial Grids')

z<-volcano
x<-10*(1:nrow(z))
y<-10*(1:ncol(z))
persp(x,y,3*z,theta=40,phi=20,scale=F,main='Mauga Whau Mountain',axes=F)
mtext('- 3D Plot by Border Shade Type -',3)
z0<-min(z)-10
z<-rbind(z0,cbind(z0,z,z0),z0)
x<-c(min(x)-1e-10,x,max(x)+1e-10)
y<-c(min(y)-1e-10,y,max(y)+1e-10)
fcol<-matrix('green',nr=nrow(z)-1,nc=ncol(z)-1)
i2<-c(1,ncol(fcol))
i1<-c(1,nrow(fcol))
fcol[,i2]<-'gray90'
fcol[i1,]<-'gray90'
zi=volcano[-1,-1]+volcano[-1,-61]+volcano[-87,-1]+volcano[-87,-61]
fcol[-i1,-i2]=terrain.colors(20)[cut(zi,quantile(zi,seq(0,1,len=21)),include.lowest=T)]
persp(x,y,3*z,theta=40,phi=20,col=fcol,scale=F,ltheta=-40,shade=0.3,border=NA,axes=F,main='Mauga Whau Mountaion')
mtext('-3D Plot by Terrain Type -',3)
