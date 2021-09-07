install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
head(mpg)

dim(mpg)
str(mpg)
summary(mpg)
View(mpg)

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy))

lm_mpg <- lm(data = mpg, hwy ~ displ)
summary(lm_mpg)

qplot(data = mpg, x = displ, y = hwy)


head(mpg)
mean(mpg$hwy)
max(mpg$hwy)
hist(mpg$hwy)

a <- 1
ab <- 3.5
c <- 3

d <- c(1, 2,3,4,5)
e <- c(1:5)
a2 <- "a"
d2 <- c("a", "b", "c")
e2 <- c("Hello", "world", "is", "good!")

b <- c("a", "a", "b", "c")
qplot(b)

paste(e2, collapse = " ")
e3_paste <- paste(e2, collapse = ", ")

head(mpg)
qplot(data = mpg, x = cty) #parameter 2개
qplot(data = mpg, x = drv, y = hwy, geom = "point")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv) # parameter 5개 
?qplot #manual보기

