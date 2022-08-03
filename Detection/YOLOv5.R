library(tidyverse)
library(gtable)
library(grid)
library(plotly)
library(lubridate)
library(magrittr)
library(gridExtra)
library(ggforce)
library(kableExtra)
library(leaflet)
library(rlang)
library(scales)
library(gridtext)


RY05 <- read_excel("Behavior Detection/YOLOv5/RY05.xlsx")

plot1 <- ggplot(RY05, aes(x =Epochs, y = TrainBox)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +  
  scale_y_continuous(breaks = seq(0.03, 0.12, 0.02))+
  xlab('') + ylab('') + labs(title= "TrainBoxLoss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot2 <- ggplot(RY05, aes(x = Epochs, y = TrainObject)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0.09, 0.15, 0.01)) +
  xlab('') + ylab('') + labs(title= "TrainObjLoss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot3 <- ggplot(RY05, aes(x = Epochs, y = TrainClass)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0, 0.06, 0.01)) +
  xlab('') + ylab('') + labs(title= "TrainClassLoss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot4 <- ggplot(RY05, aes(x =Epochs, y = ValBox)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0.04, 0.09, 0.01)) +
  xlab('') + ylab('') + labs(title= "ValBoxLoss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot5 <- ggplot(RY05, aes(x = Epochs, y = ValObj)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0.1, 0.3, 0.02)) +
  xlab('') + ylab('') + labs(title= "ValObjLoss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.02)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot6 <- ggplot(RY05, aes(x = Epochs, y = ValClass)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0, 0.06, 0.01)) +
  xlab('') + ylab('') + labs(title= "ValClassLoss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))


grid.arrange(plot1,
             plot2,
             plot3, 
             plot4, 
             plot5,
             plot6, 
             nrow=2,
             bottom = textGrob("Epochs", rot = 0, vjust = 0, gp=gpar(fontface = 6, fontsize = 16)),
             left = textGrob("Loss", rot = 90, vjust = 1, gp=gpar(fontface = 6, fontsize = 16)),
             top = textGrob("YOLOv5 Training", gp=gpar(fontface = 7, fontsize = 20))
) 

plot7 <- ggplot(RY05, aes(x =Epochs, y = Precision)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0.3, 0.9, 0.1)) +
  xlab('') + ylab('') + labs(title= "Precision") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot8 <- ggplot(RY05, aes(x = Epochs, y = Recall)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0.1, 0.55, 0.1))+
  xlab('') + ylab('') + labs(title= "Recall") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot9 <- ggplot(RY05, aes(x = Epochs, y = mAP)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0.1, 0.55, 0.1))+
  xlab('') + ylab('') + labs(title= "mAP") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))

grid.arrange(plot7,
             plot8,
             plot9,
             nrow=1,
             bottom = textGrob("Epochs", rot = 0, vjust = 0, gp=gpar(fontface = 6, fontsize = 16)),
             left = textGrob("Values", rot = 90, vjust = 1, gp=gpar(fontface = 6, fontsize = 16)),
             top = textGrob("Evaluation Metrices", gp=gpar(fontface = 7, fontsize = 20))
)

