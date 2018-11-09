##Mac Sievert
##exercise 9
rm(list=ls())
install.packages('ggplot2')
install.packages('gridExtra')
library(ggplot2)
library(grid)
library(gridExtra)
setwd('/Users/Owner/Documents/1.0Notre Dame/UNDERC')

#1. scatter plot with trend line
## These data are from using a nanodrop to assess the quality of RNA extraction samples.
## ng/ul is concentation and 260/280 is the quality
## It should trend that with better concetration you get better quality.
macdata=read.table('macdata.txt', header=T, sep='\t', stringsAsFactors=F)

a = ggplot(data = macdata, aes(x = ng.ul, y = X260.280))
a + geom_point() + theme_classic() + xlab('concentration (ng/ul)') +
    ylab('purity (260/280)') + stat_smooth(method = 'lm')

#2.bar graph of means
data=read.table('data.txt', header=T, sep=',')

b = ggplot(data = data)
b + geom_bar(aes(x = as.factor(region), y=observations), stat='summary',
             fun.y='mean',fill='blue', color='black') + theme_classic() + xlab('region') + ylab('observation mean')
#2.scatter plot of data
c = ggplot(data = data, aes(x = as.factor(region), y=observations))
c + geom_jitter(aes(color=region)) + theme_classic() + xlab('region')

## yes, the graphs tell different stories. The bar graph makes all the regions
## look the same but the scatter plot shows there is a lot of variation between 
## each region.
## The bar graph shows how the observations from different regions compare ovarall.
## The scatterplot shows the variation in the data between each region.
