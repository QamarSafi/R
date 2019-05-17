dir="D:/DS interns"
setwd(dir)

getwd()
list.files()

wine<-read.csv("wine.csv")

str(wine)
summary(wine)
head(wine$HarvestRain)
head(wine$WinterRain)

model=lm(Price~WinterRain+HarvestRain,data=wine)
summary(model)
summary(model)$r.square

cor(wine$HarvestRain,wine$WinterRain)


#calculating SSE
new.df = wine[c('WinterRain','HarvestRain')]
y_predicted = predict(model, new.df)
new.df$predicted_price = y_predicted
new.df$actual_price = wine$Price
new.df$SSE = (new.df$actual_price - new.df$predicted_price)^2


#calculating SST
baseline_mean = mean(new.df$actual_price)
baseline_mean

new.df$SST = (new.df$actual_price - baseline_mean)^2

new.df$Rsquare = 1 - (new.df$SSE / new.df$SST)
new.df$Rsquare = NULL



Rsquare = 1 - (sum(new.df$SSE) / sum(new.df$SST))
Rsquare


#------Corelation--------
cor(wine$HarvestRain,wine$WinterRain)


#------------Making Predictions
wineTest =read.csv("wine.csv")
str(wineTest)
predictTest=predict(model,newdata=wineTest)
predictTest
SSE=sum((wineTest$Price-predictTest)^2)
sst=sum((wineTest$Price -mean(wine$Price))^2)
Rsquared=1-(SSE/sst)
Rsquared


#-----Making playoffs
baseball = read.csv('baseball.csv')
View(baseball)
str(baseball)
moneyball =subset(baseball,Year<2002)
str(moneyball)

moneyball$RD =moneyball$RS -moneyball$RA
str(moneyball)

plot(moneyball$RD,moneyball$W)
winsReg =lm(W~RD,data=moneyball)
summary(winsReg)

    #       EXercise Quesion
RS=713
RA=614
data.frame()
wins=lm(W ~ RS+RA , data = moneyball)
summary(wins)

test_df = data.frame('RS'=713, 'RA'=614)
predict(wins, test_df)

predict(wins, data.frame('RS'=713, 'RA'=614))
help("predict")


#-------Predicting Runs

str(moneyball)
RunsReg =lm(RS~OBP + SLG + BA ,data=moneyball)
summary(RunsReg)

RunsReg =lm(RS~OBP + SLG  ,data=moneyball)
summary(RunsReg)


          # Exercise Quesion
1.
data.frame("OBP"=0.311,"SLG"=0.405) # Assign to a variable || Pass entire code as arguement
Runs=lm(RS ~ OBP+SLG ,data=moneyball)
summary(Runs)
# Wrong ___________________  predict(Runs,data.frame())
predict(Runs,data.frame("OBP"=0.311,"SLG"=0.405))

2.
data.frame("OOBP"=0.297,"OSLG"=0.370)
RunsAllowed=lm(RA ~ OOBP+OSLG ,data=moneyball)
summary(RunsAllowed)
# Wrong ___________________ predict(RunsAllowed,data.frame())
predict(RunsAllowed,data.frame("OOBP"=0.297,"OSLG"=0.370))




#==========The data===
data=read.csv("NBA_train.csv")
str(data)
table(data$W,data$Playoffs)

data$PTSdiff =data$PTS- data$oppPTS
plot(data$PTSdiff,data$W)

wins =lm(W~PTSdiff,data=data)
summary(wins)





######Logistic Regression#########

quality =read.csv("quality1.csv")
str(quality)
table(quality$PoorCare)

install.packages("caTools")

library(caTools)
set.seed(88)
split =sample.split(quality$PoorCare,SplitRatio = 0.75)
split

qualityTrain =subset(quality,split==TRUE)
qualityTest =subset(quality,split==FALSE)

nrow(qualityTest)


Qualitylog = glm(PoorCare ~  OfficeVisits   +Narcotics ,family =binomial,data = qualityTrain)
summary(Qualitylog)

predictTrain = predict(Qualitylog,type="response")
summary(predictTrain)

tapply(predictTrain,qualityTrain$PoorCare,mean)

   #======= Exercise=====
Qualitylog = glm(PoorCare ~  StartedOnCombination ,family =binomial,data = qualityTrain)
summary(Qualitylog)


#---Threshold----

table(qualityTrain$PoorCare,predictTrain>0.5)
table(qualityTrain$PoorCare,predictTrain>0.7)
table(qualityTrain$PoorCare,predictTrain>0.2)

#-------ROC Curves(Reciever Operator Cheracteristics)
install.packages("ROCR")
library(ROCR)
ROCRpred =prediction(predictTrain,qualityTrain$PoorCare)

ROCRpref =performance(ROCRpred,"tpr","fpr")
plot(ROCRpref)
plot(ROCRpref,colorize=TRUE)
plot(ROCRpref,colorize=TRUE,print.cutoffs.at=seq(0,1,0.1),text.adj=c(-0.2,1.7))



#Interpreting models

predictTest = predict(Qualitylog, type="response", newdata=qualityTest)


ROCRpredTest = prediction(predictTest, qualityTest$PoorCare)

auc = as.numeric(performance(ROCRpredTest, "auc")@y.values)
auc



  # -------------LOgistic Regression________
framingham = read.csv("framingham.csv")
str(framingham)

library(caTools)
set.seed(1000)
split =sample.split(framingham$TenYearCHD,SplitRatio = 0.65)
train =subset (framingham,split==TRUE)
test =subset(framingham,split==FALSE)
framinghamLog =glm(TenYearCHD ~., data =train,family=binomial)
summary(framinghamLog)

predictTest =predict(framinghamLog,type="response",newdata=test)
table(test$TenYearCHD,predictTest>0.5)
help("table")

library(ROCR)
ROCRpred =prediction(predictTest,test$TenYearCHD)
as.numeric(performance(ROCRpred,"auc")@y.values)


     #Exercise
#table(test$,predictTest>0.5)


#----------Dealing with Missing data----
polling=read.csv("PollingData.csv")
str(polling)

table(polling$Year)


summary(polling)

install.packages("mice")

library("mice")
View(polling)
colnames(polling)
col_list <- c("Rasmussen","SurveyUSA","DiffCount","PropR")
head(polling[col_list])
head(polling[,c("Rasmussen","SurveyUSA","DiffCount","PropR")])
polling[7,c("Rasmussen","SurveyUSA","DiffCount","PropR")]
polling[1:5,c("Rasmussen","SurveyUSA","DiffCount","PropR")]
polling[,c("Rasmussen","SurveyUSA","DiffCount","PropR")]


simple = polling[c("Rasmussen","SurverUSA","PropR","DiffCount")]
summary(simple)

simple <- subset(polling,select = c(3,4,6,5))
simple
summary(simple)

set.seed(144)
imputed =complete(mice(simple))

summary(imputed)
polling$Rasmussen =imputed$Rasmussen
polling$SurveyUSA =imputed$SurveyUSA
summary(polling)

###==========Sophisticated Baseline Method====
Train = subset(polling, Year == 2004 | Year == 2008)
Test = subset(polling,Year==2012)
table(Train$Republican)
sign(20)
sign(-10)
sign(0)
table(sign(Train$Rasmussen))

table(Train$Republican,sign(Train$Rasmussen))

cor(Train)
str(Train)
cor(Train[c("Rasmussen","SurveyUSA","PropR","DiffCount","Republican")])

modl= glm(Republican~PropR ,data=Train,family ="binomial")
summary(modl)
pred1 =predict(modl,type="response")
table(Train$Republican,pred1>= 0.5)

mod2= glm(Republican~SurveyUSA+DiffCount ,data=Train,family ="binomial")
pred2 = predict(mod2,type="response")
table(Train$Republican,pred2>= 0.5)
summary(mod2)

#--------Test Predictions

table(Test$Republican,sign(Test$Rasmussen))
TestPrediction =predict(mod2,newdata =Test ,type ="response")
table(Test$Republican,TestPrediction>=0.5 )

subset(Test,TestPrediction>=0.5 & Republican == 0)



### Exercise####
songs = read.csv("songs.csv")

length(songs$artistname)
length(songs[songs$artistname == 'Michael Jackson',])
max()

2.1
dim(songs)
dim(SongsTrain)
SongsTrain =subset(songs,year==2009)
dim(SongsTrain)
SongsTest =subset(songs,year=2010)
table(SongsTrain$year == 2009)
View(SongsTrain)
table(SongsTrain$Top10)
str(SongsTrain)


SongsLog1 = glm(Top10 ~ ., data=Songstrain, family=binomial)

nonvars = c("year", "songtitle", "artistname", "songID", "artistID")


  
SongsTrain = SongsTrain[ , !(names(songsTrain) %in% nonvars) ]

SongsTest = SongsTest[ , !(names(songsTest) %in% nonvars) ]
SongsLog1 = glm(Top10 ~ ., data=Songstrain, family=binomial)

3.1
cor()
SongsLog2 = glm(Top10 ~ . - loudness, data=SongsTrain, family=binomial)


parole =read.csv("parole.csv")
str(parole)
summary(parole)
table(parole$violator )
(parole[parole$violator,])



###------------- CART in R
stevens = read.csv("stevens1.csv")
str(stevens)
library(caTools)
set.seed(3000)
spl =sample.split(stevens$Reverse,SplitRatio = 0.7)
train = subset(stevens,spl ==TRUE)
test = subset(stevens,spl ==FALSE)

install.packages("rpart")
install.packages("rpart.plot")
install.packages("rattle")
install.packages("RColorBrewer")

library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)



stevensTree =rpart(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",minbucket=25)
prp(stevensTree)
 
PredictCART =predict(stevensTree,newdata = test ,typr ="class") 
table(test$Reverse,PredictCART)
(41+71)/(41+36+22+71)
library(ROCR)
PredictROC = predict(stevensTree,newdata =test)
head(PredictROC)
pred = predict(stevensTree,newdata = test)


help("prediction")
help("performance")

pred = prediction(PredictROC[,2], test$Reverse)
pref <- performance(pred,"tpr","fpr")
plot(pref)


###-------EXERCISE 
1.1
as.numeric(performance(pred, "auc")@y.values)
1.2
stevensTree =rpart(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",minbucket=5)
prp(stevensTree)
1.3
stevensTree =rpart(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",minbucket=100)
prp(stevensTree)



##-------RANDOM FOREST______
install.packages("randomForest")

library(randomForest)

stevensForest = randomForest(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",nodesize=25,ntree=200 )
train$Reverse = as.factor(train$Reverse)
test$Reverse = as.factor(test$Reverse)
stevensForest = randomForest(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",nodesize=25,ntree=200 )
PredictForest = predict(stevensForest,newdata = test)
table(test$Reverse,PredictForest)
(43+73)/(43+34+20+73)

    ###-----Exercise-----
1.1
set.seed(100)
stevensForest = randomForest(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",nodesize=25,ntree=200 )
train$Reverse = as.factor(train$Reverse)
test$Reverse = as.factor(test$Reverse)
stevensForest = randomForest(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",nodesize=25,ntree=200 )
PredictForest = predict(stevensForest,newdata = test)
table(test$Reverse,PredictForest)
(42+74)/(42+35+19+74)

1.2
set.seed(200)
stevensForest = randomForest(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",nodesize=25,ntree=200 )
train$Reverse = as.factor(train$Reverse)
test$Reverse = as.factor(test$Reverse)
stevensForest = randomForest(Reverse ~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",nodesize=25,ntree=200 )
PredictForest = predict(stevensForest,newdata = test)
table(test$Reverse,PredictForest)
(45+76)/(45+32+17+76)


##===========Cross validation===
install.packages("caret")
install.packages("e1071")

library(caret)
library(e1071)
numFolds = trainControl(method ="cv",number =10)

cpGrid = expand.grid(.cp =seq(0.01,0.5,0.01))
train(Reverse~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "rpart",trControl = numFolds,tuneGrid = cpGrid)


stevensTreeCV = rpart(Reverse~ Circuit + Issue + Petitioner +Respondent +LowerCourt + Unconst,data=train ,method = "class",cp=0.19)
PredictCV = predict(stevensTreeCV,newdata = test ,type = "class")
table(test$Reverse,PredictCV)
(59+64)/(59+18+29+64)
##______EXERCIRSISE
prp(stevensTreeCV)

#-----------------Claims data in R
Claims = read.csv("ClaimsData.csv")
str(Claims)
table(Claims$bucket2009)/nrow(Claims)
library(caTools)
set.seed(88)
spl = sample.split(Claims$bucket2009,SplitRatio = 0.6)
claimstest = subset(Claims,spl == FALSE)
claimstrain = subset(Claims,spl == TRUE)
mean(claimstrain$age)
table(claimstrain$diabetes)/nrow(claimstrain)

###------------Baseline method
table(claimstest$bucket2009,claimstest$bucket2008)
(164967+16172 +4004 +2399+141)/nrow(claimstest)
PenalityMatrix = matrix(c(0,1,2,3,4,2,0,1,2,3,4,2,0,1,2,6,4,2,0,1,8,6,4,2,0),byrow = TRUE,nrow=5)
PenalityMatrix
as.matrix(table(claimstest$bucket2009,claimstest$bucket2008))*PenalityMatrix
sum(as.matrix(table(claimstest$bucket2009,claimstest$bucket2008))*PenalityMatrix)/nrow(claimstest)

##Predicting hEALTHCARE COSTS
library(rpart)
library(rpart.plot)
colnames(claimstrain)
claimsTree = rpart(bucket2009 ~ age + alzheimers + arthritis + cancer + copd + depression + diabetes + heart.failure + ihd + kidney + osteoporosis + stroke + reimbursement2008 + bucket2008,data =claimstrain ,method = "class",cp=0.00005)
prp(claimsTree)



predictTest = predict(claimsTree,newdata=claimstest,type="class")
table(claimstest$bucket2009 ,predictTest)


as.matrix(table(claimstest$bucket2009 ,predictTest))*PenalityMatrix

sum(as.matrix(table(claimstest$bucket2009 ,predictTest))*PenalityMatrix)/nrow(claimstest)
claimsTree = rpart(bucket2009 ~ .,data =claimstrain ,method = "class",cp=0.00005,parms = list(loss=PenalityMatrix))
predictTest = predict(claimsTree,newdata=claimstest,type="class")
table(claimstest$bucket2009 ,predictTest)
sum(as.matrix(table(claimstest$bucket2009 ,predictTest))*PenalityMatrix)/nrow(claimstest)
                                                            
#####The data
boston = read.csv("boston.csv")
str(boston)
plot(boston$LON,boston$LAT)
points(boston$LON[boston$CHAS==1],boston$LAT[boston$CHAS==1],col="blue",pch=19)
points(boston$LON[boston$TRACT==3531],boston$LAT[boston$TRACT==3531],col="red",pch=19)
summary(boston$NOX)

points(boston$LON[boston$NOX>0.55],boston$LAT[boston$NOX>0.55],col="green",pch=19)
plot(boston$LON,boston$LAT)
summary(boston$MEDV)
points(boston$LON[boston$MEDV>=21.2],boston$LAT[boston$MEDV>=21.2],col="yellow",pch=19)

#Graphical prediction
plot(boston$LAT,boston$MEDV)
plot(boston$LON,boston$MEDV)
latlonlm = lm(MEDV ~ LAT + LON,data=boston)
summary(latlonlm)


plot(boston$LON,boston$LAT)
plot(boston$LON[boston$MEDV>= 21.2],boston$LAT[boston$MEDV>=21.2],color="red",pch=19)
points(boston$LON[boston$MEDV>=21.2],boston$LAT[boston$MEDV>=21.2])
latlonlm$fitted.values

points(boston$LON[latlonlm$fitted.values>=21.2],boston$LAT[latlonlm$fitted.values>=21.2],col ="Blue",pch="$")

####----= ------------------REGRESSION TREES______
library(rpart)
library(rpart.plot)
latlontree =rpart(MEDV ~ LAT + LON ,data = boston)
prp(latlontree)
plot(boston$LAT,boston$LON)
points(boston$LON[boston$MEDV>=21.2],boston$LAT[boston$MEDV>=21.2],col="red",pch=19)
fittedvalues = predict(latlontree)
points(boston$LON[fittedvalues>=21.2],boston$LAT[fittedvalues>=21.2],col="blue",pch="$")

help("points")


Quan_continuous <- c(23.5,45.6,87.76,987.453)  # Price
Quan_discrete <- c(5,6,3,90,25)                # Age
Qual_Ordinal <- c(A,B,C,D,E)                   # Grade
Qual_Nominal <- c(Male,Female)                 # Gender







# YouTube --> Augmented Startups Machine LEarning playlist
