# ---loading/splitting dataset---
Fish <- read.table("data_Fish.csv", sep = ";", header=TRUE)
Fish = na.omit(Fish)
set.seed(123)
training.samples <- Fish$Species %>% 
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- Fish[training.samples, ]
test.data <- Fish[-training.samples, ]



#---Analyzing data---
train.data
sapply(train.data, sd)
summary(train.data)
nrow(train.data)
nrow(subset(train.data, Species==0))
nrow(subset(train.data, Species==1))

#---Pre-processing data---
train.data = subset(train.data, select=-c(Width))
train.data$Weight=scale(train.data$Weight)
train.data$Height=scale(train.data$Height)

test.data$Weight=scale(test.data$Weight)
test.data$Height=scale(test.data$Height)



#---Training the model---
# Fit the model
model <- glm( Species ~ ., data = train.data, family = binomial)

# Summarize the model
summary(model)



#---Testing the model---
# Make predictions
test.data$PredictedSpecies <- model %>% predict(test.data, type = "response")
test.data$PredictedSpecies <- ifelse(test.data$PredictedSpecies > 0.50, 1, 0)

#Confusion matrix
table(test.data$PredictedSpecies,test.data$Species)

# Model accuracy
mean(test.data$PredictedSpecies == test.data$Species)