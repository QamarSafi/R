"Hello World!"

dir = "D:/DS interns"
setwd(dir)

mydata <- read.csv("Mispriced-Diamonds.csv")


library("ggplot2")

ggplot(data=mydata[mydata$carat<2.5,],
       aes(x=carat,y=price,colour=clarity)) + 
  geom_point(alpha=0.1)+
  geom_smooth()

#integer
x<- 2L
typeof(x)

#double
y<- 2.5
typeof(y)

#integer
x<- 2
typeof(x)

#complex
z<- 3+2i
typeof(z)

#character
a<-'h'
typeof(a)

#logical
q1<- T;
typeof(q1);
q2 <- FALSE;
typeof(q2);



###########USING VARIABLES############

A<-10
B<-5

c<-A+B
c

#Variables
var1 <-2.5
var2 <-4

result<- var1/var2
result

anwer<-sqrt(var2)
anwer

greeting<-"Hello"
name<- "Bob"
message<- paste(greeting,name)
message


$$$$$$$$$$$LOGICAL VARIABLES AND $$$$$$$$$$$$$$$$$$$

#logical
#TRUE T
#FALSE F

4<5
10>100
4==5

# ==
# !=
# <
# >
# <=
# >=
# !
# |
# &
# isTRUE(x)

result<- 4<5
result
typeof(result)
result2<- !(5>1)
result2

result|result2
result&result2

isTRUE(result)


# *******************WHILE LOOP***************************

  while(TRUE)
  {
    print("Hello!")
  }


counter <- 1
 while(counter<12)
{
  print(counter)
  counter<- counter + 1
 }



# **************FOR LOOP*****************************
  
  for(i in 1:5)
  {
    print("Hello Qamar !")
  }




for(i in  51:56)
{
  print("Hello Qamar !")
}


# **************IF ELSE STATEMENTS************************

rm(answer)
q<- rnorm(1)
  if(q>1){
    answer<- "Greater than 1"
  
}else{
  anwer<- "Lesser than 1"
}


# ***********Vectors**************************

MyFirstVector <- c(3,45,56,732) 
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L,2L,12L,243L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

v3 <- c('a','B23',"Hello")
v3
is.character(v3)
is.numeric(v3)
is.integer(v3)
is.double(v3)

seq()  #sequence - like ":"
rep()  #replicate

seq(1,15)
1:15

seq(1,15,3)


rep(3,50)
d <-rep(3,50)
rep("Q",5)


x <-c(80,50)
y <-rep(x,10)
y

x <-c(80,50)
y <-rep(x,10)
z<- seq(201,250,11)




# @@@@@@@@@@@@@@@@@@@@@@USING BRACKETS@@@@@@@@@@@@@@@@@
w <- c("Q","A","M","A","R")
w[1]
w[2]
w[3]
w[4]
w[5]
  w[-2]
 w[1:3] 
w[-1:-3] 
w[c(1,3,5)]




# $$$$$$$$$$$$$$$$VECTOR OPERATIONS$$$$$$$$$$$$$$$$$$$$$$
 x <- rnorm(5)
x


for(i in x){
  print(i)
}
print(x[1])


for(j in 1:5){
  print(x[j])
}
 

N=10000
r <- rnorm(N)
t <- rnorm(N)

#vectorized 
s <- r*t
s

#De-vectorized

e <- rep(NA,N)
for(i in 1:N)
{
  e[i] <- s[i] * t[i]
}  
# $$$$$$$$$$$$$$$$$$$REVISION SEction$$$$$$$$$$$$$$$$$$$$

rnorm(n=5 ,mean=10, sd=8)

x<-c("a","b","c")

c()
seq(from=10,to=20,along.with=x)
rep(5:6,each=10)

print()

isnumeric()
is.integer()
is.double()
is.character()

typeof()

A
B<-sqrt(A)
B

sqrt()
paste()







installed.packages("ggplot2")


?ggplot

library(ggplot2)
?ggplot
?qpplot()

qplot(data=diamonds ,carat,price,colour=clarity,facets=.~clarity)


















# $$$$$$$$$$$$$$$$$$$$$$$$unit 4#########################
Matrices

# problem: BASKET bALL


import("D:\DS interns\Basketball data")


my.data<-1:20
my.data


A<- matrix(my.data,4,5)
A
A[2,3]


B<- matrix(my.data,4,5,byrow=T)
B
B[2,5]
B

#rbind()

r1<- c("I","am","Happy")
r2<- c("What",'a','day')
r3<- c(1,2,3)
V<- rbind(r1,r2,r3)
V



#cbind()
c1<-1:5
c2<- -1:-5
D<-cbind(c1,c2)
D






# %%%%%%%%%%%%%%%Named vectors%%%%%%%%%%%%%%%%%%%%%%%%%%%
charlie<-1;5
charlie


#clear names
names(charlie)<-NULL
charlie


_______________________Naming Matrix DIMENSIONS1_____________
temp.vec<-rep(c('a','B','Zz'),3)
rep(c('a','B','Zz'),times=3)
rep(c('a','B','Zz'),each=3)
temp.vec<-rep(c('a','B','Zz'),3)
temp.vec


Bravo<- matrix(temp.vec,3,3)
Bravo

row.names(Bravo)<-  c('How',' are',' you?')
Bravo

Bravo["are","Y"]<- 0
Bravo








# _______________Choosing file_test()_________________________
stat<-(file.choose())
stat

#method2
getwd()

#windows:
dir = "D:/DS interns"
setwd(dir)
list.files()
stats<- read.csv( "Demographic-Data.csv" )         
stats

# ----------------Exploring data-------------
stats
nrow(stats)
nrow


ncol(stats)
ncol

head(stats,n=10)

tail(stats,n=8)

str(stats)  --------#str-structure
                    #runif()- r uni if
summary(stats)


#--------using the $ sign

stats[3,3]

stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
head(stats)
levels(stats$Income.Group)


#------------- Basic operations with a DF -----
stats[1:10,]
stats[3:9,]
stats[c(4,100),]

is.data.frame(stats[1,]) 
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])
stats$Birth.rate * stats$Internet.users
head(stats)
stats$MyCalc <- Birth.rate*stats$Internet.users

#test of knowledge
stats$xyz <-1:5
head(stats)

#removal of columns
stats$MyCalc <- NULL
head(stats)



#==========Filtering Data Frames+++============
head(stats)
filter <-stats$Internet.users <2
stats[1:100,]
stats[filter,]

stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users <2,]

stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)


stats[stats$Country.Name =="Malta",]


###----------Introduction to qplot()
#install.packages("ggplot")
library(ggplot2)
?qplot
qplot(data=stats,x=stats$Internet.users)
qplot(data=stats,x=stats$Income.Group,y=Birth.rate)
qplot(data=stats,x=stats$Income.Group,y=Birth.rate,size=10)
qplot(data=stats,x=stats$Income.Group,y=Birth.rate,size=10,colour=I('blue'))
qplot(data=stats,x=stats$Income.Group,y=Birth.rate,size=10,colour=('blue'))
qplot(data=stats,x=stats$Income.Group,y=Birth.rate,size=10,colour=I('blue'),geom="boxplot")


#----------VIsualization -----
qplot(data=stats,x=Internet.users,y=Birth.rate)
qplot(data=stats,x=stats$Internet.users,y=Birth.rate,size=I(4))
qplot(data=stats,x=stats$Internet.users,y=Birth.rate,size=I(4),color=I("red"))
qplot(data=stats,x=stats$Internet.users,y=Birth.rate,color=Income.Group,size=I(4))



#---------------Creating Data Frame---------
#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")


#(c) Kirill Eremenko, www.superdatascience.com

mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#colnames(mydf)<-c('country',"code","region")      
#head(mydf)


rm(mydf)
mydf <- data.frame(Countries=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region= Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)


###++++++++++++==Merging dataframes++++++++++++++
#head(mydf)

rm(mydf)
mydf <- data.frame(Countries=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region= Regions_2012_Dataset)
head(mydf)
head(stats)
tail(mydf)
summary(mydf)

merged <- merge(stats,mydf,by.x = "Country.Code",by.y="Code")
head(merged)

mrged$Country <- NULL
str(merged)
tail(merged)



#=======================Visualization with new split
qplot(data=merged,x=Internet.users,y=Birth.rate)
qplot(data=merged,x=Internet.users,y=Birth.rate,color=Region)

  #1.Shape
qplot(data=merged,x=Internet.users,y=Birth.rate,color=Region,size=I(5),shape=I(11))


#2.Transparancy
qplot(data=merged,x=Internet.users,y=Birth.rate,color=Region,size=I(5),shape=I(11),alpha=I(0.4))

#3.Title
qplot(data=merged,x=Internet.users,y=Birth.rate,color=Region,size=I(5),shape=I(11),alpha=I(0.4),main="Birth Rate vs Internet Rate")



#____________________Factor
getwd()
dir="D:/DS interns"
setwd(dir)
list.files()

Movies<- read.csv("Movie_Review.csv")
head(Movies)
colnames(Movies)<- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(Movies)
tail(Movies)
str(Movies)
summary(Movies)

factor(Movies$Year)
Movies$Year <- factor(Movies$Year)

summary(Movies)
str(Movies)


#-----------Aesthetics------
install.packages("ggplot2")
library(ggplot2)

ggplot(data=Movies,aes(x=CriticRating,y=AudienceRating))

#adding geometry
ggplot(data=Movies,aes(x=CriticRating,y=AudienceRating))+
  geom_point()

##adding color
ggplot(data=Movies,aes(x=CriticRating,y=AudienceRating,color=Genre))+
  geom_point()


##adding size
ggplot(data=Movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=Genre))+
  geom_point()


##adding size a better way
ggplot(data=Movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=BudgetMillions))+
  geom_point()


#Plotting with layers
p <- ggplot(data=Movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=BudgetMillions))

#adding point  
p+geom_point()

#adding line
p+geom_line()

#multiple layers
p+geom_point()+geom_line()
p + geom_line() + geom_point()


#-------Overriding Aesthetics---
q<-ggplot(data=Movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=BudgetMillions))

#overiding aes
q+ geom_point(size=CriticRating)

q+color=