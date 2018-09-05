#' Reading is alldata
#'
#' @param dir is directory.
#' @return alldata  #Sys.setenv( JAVA_HOME = 'C:\\Program Files\\Java\\jre1.8.0_151' )
#' @export
set=function(){
  if(!require(maps))install.packages('maps');library(maps)
  if(!require(mapdata))install.packages('mapdata');library(mapdata)
  if(!require(ggmap))install.packages('ggmap');library(ggmap)
  if(!require("XML")) install.packages("XML");library(XML)
  if(!require("stringr")) install.packages("stringr");library(stringr)
  if(!require("RCurl")) install.packages("RCurl");library(RCurl)
  if(!require("tm")) install.packages("tm");library(tm)
  if(!require("SnowballC")) install.packages("SnowballC");library(SnowballC)
  if(!require("wordcloud")) install.packages("wordcloud");library(wordcloud)
  if(!require("RColorBrewer")) install.packages("RColorBrewer");library(RColorBrewer)
}
