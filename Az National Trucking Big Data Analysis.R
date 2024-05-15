rm(list = ls())
# Load data
truck <- read.csv("regression_truck_csv.csv")

# Check summary of the dataset
summary(truck)
colnames(truck)


truck=data.frame(truck)



# Fit linear regression model, excluding specified columns
Lin_reg <- lm(truck$Avg..Riskfactor ~ truck$Avg..Velocity + truck$Avg..Mpg + truck$Events, data = truck)

# Get summary of the regression model
summary(Lin_reg)

truck$predicted <- predict(Lin_reg, truck)

ggplot(truck, aes(x = truck$Avg..Riskfactor, y = predicted)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  xlab("Average riskfactor") + 
  ylab("Predicted valies")



