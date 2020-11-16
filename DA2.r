library(readr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggthemes)

hp <- read_csv("C:/Users/Sruthi Shiva/Desktop/College/Semester 5/CSE3020/DA1/hp.csv")
View(hp)

ggplot(hp, aes(Classification))+
  geom_bar(fill = "#3282cd") +
  labs(x = "Curse Classification")+
  labs(y = "Frequency")

np <- hp[ which(hp$Classification!="Curse"),]
counts <- table(np$Classification,np$Book)
barplot(counts, main="Charms Vs Spells",
        xlab="Book", col=c("#36688D","#F18904"),
        beside=TRUE)

getPalette = colorRampPalette(brewer.pal(9, "Set1"))
np <- hp[ which(hp$Classification=="Curse"),]
ggplot(np, aes(Book))+
  geom_bar(aes(fill = Spell) ) +
  labs(x = "Book")+
  labs(y = "Frequency", title="Distribution of Curses in the Books")+
  scale_fill_brewer(palette="Set2")

np <- hp[ which(hp$Classification!="Spell"),]
ggplot(np, aes(x=Position, y=Spell)) + 
  geom_point(aes(col=Book))

np <- hp[ which(hp$Spell=="Alohomora"),]
s<-ggplot(np, aes(x="", fill=factor(Book))) + 
  geom_bar(width = 1) +
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5))+
  labs(fill="class", 
       x=NULL, 
       y=NULL)
s+coord_polar(theta = "y", start=0)
