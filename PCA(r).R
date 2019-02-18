#Data
data(iris)
str(iris)
summary(iris)

#Partititon data
set.seed(11)
div<-sample(2,nrow(iris),replace = TRUE,prob = c(0.8,0.2))
traning<-iris[div==1,]
testing<-iris[div==2,]
dim(traning)
dim(testing)

#Scatter Plot and correlation coefficient
install.packages("psych")
library(psych)
pairs.panels(traning[,-5],gap=0,bg=c("red","yellow","green")[traning$Species],pch=21)
#High Corrleation between independent data this is problem of Multicolinearity 

#PCA
pc<-prcomp(traning[,-5],center =TRUE,scale. = TRUE)
attributes(pc)
pc$sdev
pc$rotation
pc$center#mean
pc$scale#standard deviation
summary(pc)
print(pc)
#output

R version 3.5.1 (2018-07-02) -- "Feather Spray"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

> #Data
  > data(iris)
> str(iris)
'data.frame':	150 obs. of  5 variables:
  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
$ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
$ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
$ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
$ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
> summary(iris)
Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500                  
> #Partititon data
  > set.seed(11)
> div<-sample(iris,nrow(iris),replace = TRUE,prob = c(0.8,0.2))
Error in sample.int(length(x), size, replace, prob) : 
  incorrect number of probabilities
> div<-sample(2,nrow(iris),replace = TRUE,prob = c(0.8,0.2))
> traning<-iris[div==1,]
> testing<-iris[div==2,]
> dim(traning)
[1] 131   5
> dim(testing)
[1] 19  5
> #Scatter Plot and correlation coefficient
  > install.packages("psych")
Installing package into 'C:/Users/Manpreet.saluja/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
also installing the dependency 'mnormt'

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/mnormt_1.5-5.zip'
Content type 'application/zip' length 117460 bytes (114 KB)
downloaded 114 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/psych_1.8.12.zip'
Content type 'application/zip' length 5908979 bytes (5.6 MB)
downloaded 5.6 MB

package 'mnormt' successfully unpacked and MD5 sums checked
package 'psych' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Manpreet.saluja\AppData\Local\Temp\RtmpIfzXkD\downloaded_packages
> library(psych)
Warning message:
  package 'psych' was built under R version 3.5.2 
> pairs.panels(traning[,-5],gap=0,bg=c("red","yellow","green")[traning$Species],pch=21)
> #PCA
  > pc<-prcomp(traning[,-5],center =TRUE,scale. = TRUE)
> attributes(pc)
$`names`
[1] "sdev"     "rotation" "center"   "scale"    "x"       

$class
[1] "prcomp"

> pc$sdev
[1] 1.7120765 0.9495987 0.3803323 0.1496785
> pc$rotation
PC1         PC2        PC3        PC4
Sepal.Length  0.5179241 -0.39156626  0.7150212  0.2591818
Sepal.Width  -0.2814334 -0.91701833 -0.2518406 -0.1282535
Petal.Length  0.5788076 -0.02620672 -0.1427377 -0.8024469
Petal.Width   0.5634995 -0.07117901 -0.6363544  0.5219721
> pc$center
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
5.866412     3.067176     3.774046     1.206870 
> pc$scale
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
0.8062840    0.4500329    1.7516405    0.7596751 
> #PCA
  > pc<-prcomp(traning[,-5],center =TRUE,scale. = TRUE,cor=TRUE)
Warning message:
  In prcomp.default(traning[, -5], center = TRUE, scale. = TRUE, cor = TRUE) :
  extra argument 'cor' will be disregarded 
> #PCA
#  > pc<-prcomp(traning[,-5],cor=TRUE,center =TRUE,scale. = TRUE)
#Warning message:
 # In prcomp.default(traning[, -5], cor = TRUE, center = TRUE, scale. = TRUE) :
  #extra argument 'cor' will be disregarded 
#> summary(pc)
#Importance of components:
 # PC1    PC2     PC3    PC4
#Standard deviation     1.7121 0.9496 0.38033 0.1497
#Proportion of Variance 0.7328 0.2254 0.03616 0.0056
#Cumulative Proportion  0.7328 0.9582 0.99440 1.0000
#> print(pc)
#Standard deviations (1, .., p=4):
 # [1] 1.7120765 0.9495987 0.3803323 0.1496785

#Rotation (n x k) = (4 x 4):
 # PC1         PC2        PC3        PC4
#Sepal.Length  0.5179241 -0.39156626  0.7150212  0.2591818
#Sepal.Width  -0.2814334 -0.91701833 -0.2518406 -0.1282535
#Petal.Length  0.5788076 -0.02620672 -0.1427377 -0.8024469
#Petal.Width   0.5634995 -0.07117901 -0.6363544  0.5219721
# rotation (4*4) also called loading here we have 4 loadining because we have 4 paramters  hence coefficient of loadings are linear combination of continuos variables
# all the values of pc lie betwen -1 and +1


#now let us see what -ve and +ve value indicates
#lets take an example of pc1 we can say that whenver sepal.length ,petal.length or petal.width will increase when one of that will increase and sepal width will decrease

summary(pc)
#variance indicates the data
#variance of pc1 control 73 % of variablilty and pc2 22% or variability

#Orthogonality of Pcs
pairs.panels(pc$x,gap=0,bg=c("red","yellow","green")[traning$Species])
#since pc are orthogonal corrlation is 0
