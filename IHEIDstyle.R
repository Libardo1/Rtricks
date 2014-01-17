library(ggplot2)
library(scales)
library(gridExtra)



darkRed <- rgb(199,35,28, maxColorValue = 255)
darkGray <- rgb(128,128,128, maxColorValue = 255)
darkOLDblue <- rgb(0,15,118, maxColorValue = 255)
lightgray <- rgb(200,200,200, maxColorValue = 255)


if(FALSE){
  colTest <- rgb(128,128,128, maxColorValue = 255)
  plot(1, 1, cex=10, pch=19,col=colTest)
}
# darkRed<-rgb(0,15,118, maxColorValue = 255)

darkRed_08<-rgb(199,35,28, alpha=0.8*255, maxColorValue = 255)
# darkRed_08<-alpha(darkRed, 0.8)
darkRed_06<-rgb(199,35,28, alpha=0.6*255, maxColorValue = 255)
# darkRed_06<-alpha(darkRed, 0.6)
darkRed_04<-rgb(199,35,28, alpha=0.4*255, maxColorValue = 255)
# darkRed_04<-alpha(darkRed, 0.4)


lightgray_03<-rgb(240,240,240, maxColorValue = 255, alpha=0.3*255) #alpha(lightgray, 0.3)
lightgray_00<-rgb(240,240,240, maxColorValue = 255, alpha=0*255) # alpha(lightgray,0)

theme_update( 
plot.background = element_rect(fill = lightgray), 
# plot.background = element_rect(fill = lightgray), 
panel.background = element_rect(fill = lightgray, colour=NA), 
# panel.background = element_rect(fill = lightgray), 
panel.border = element_blank(),
panel.grid.minor = element_blank(), 
panel.grid.major = element_line(colour= "white"), 
panel.grid.major.x = element_blank(), 
axis.text.x = element_text(colour= "black"), 
axis.text.y = element_text(colour= "black"), #arg hjust?
axis.title.x = element_text(colour= "black", face="bold", size=20, vjust=0.1), 
axis.title.y = element_text(colour= "black", angle=90, face="bold", size=20), 
axis.ticks= element_blank(), 
strip.text.y = element_text(colour= "black", angle=270,face="bold", size=36), 
# strip.background = element_rect(fill = darkRed,colour=darkRed, size=10) 
strip.background = element_rect(fill = darkGray,colour=darkGray, size=100), 
strip.text.x=element_text(size=30, colour="white")
)

##from http://groups.google.com/group/ggplot2/browse_thread/thread/7d070f37fa21b002/a4c8008a64c411bd?lnk=gst&q=grid+vertical+only#a4c8008a64c411bd

## onBar chart without vertical grid koshke
# guide_grid <- function(theme, x.minor, x.major, y.minor, y.major) {
#   ggplot2:::ggname("grill", grobTree(
#     theme_render(theme, "panel.background"),
# 
#     theme_render(
#       theme, "panel.grid.minor", name = "y",
#       x = rep(0:1, length(y.minor)), y = rep(y.minor, each=2),
#       id.lengths = rep(2, length(y.minor))
#     ),
#       theme_render(
#       theme, "panel.grid.major", name = "y",
#       x = rep(0:1, length(y.major)), y = rep(y.major, each=2),
#       id.lengths = rep(2, length(y.major))
#     )
#   ))
# } 
# 
# assignInNamespace("guide_grid", ggplot2:::guide_grid, pos="package:ggplot2") 
myScale_fill <- function(...) scale_fill_manual(value = rep(c(darkRed,darkRed_08,darkRed_06,darkRed_04),2),...)
myScale_col <- function(...) scale_colour_manual(value = rep(c(darkRed_08,darkRed,darkRed_06,darkRed_04),2),...) 


update_geom_defaults("line", aes(fill= darkRed, size=2, colour=darkRed))
update_geom_defaults("bar", aes(fill= darkRed))
update_geom_defaults("point", aes(fill= "white", size=3,colour="white"))



