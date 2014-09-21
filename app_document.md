# Predict the Price of Your Car

### Sunday, September 21, 2014
========================================================
## Synopsis
This application implements a multivariate regression model to determine car values based on a variety of characteristics such as mileage, make, model, engine size, interior style, and cruise control. Users can select the variables for linear regression and the output is the price of the car. 

## Dataset Introduction

This application uses the 'caret::cars' dataset from Rstudio. In this data set, a representative sample of over eight hundred 2005 GM cars were selected, then retail price was calculated from the tables provided in the 2005 Central Edition of the Kelly Blue Book (see Section 11).


```r
library(caret)
```

```
## Loading required package: lattice
## Loading required package: ggplot2
```

```r
data(cars)
summary(cars)
```

```
##      Price          Mileage         Cylinder        Doors     
##  Min.   : 8639   Min.   :  266   Min.   :4.00   Min.   :2.00  
##  1st Qu.:14273   1st Qu.:14624   1st Qu.:4.00   1st Qu.:4.00  
##  Median :18025   Median :20914   Median :6.00   Median :4.00  
##  Mean   :21343   Mean   :19832   Mean   :5.27   Mean   :3.53  
##  3rd Qu.:26717   3rd Qu.:25213   3rd Qu.:6.00   3rd Qu.:4.00  
##  Max.   :70755   Max.   :50387   Max.   :8.00   Max.   :4.00  
##      Cruise          Sound          Leather          Buick       
##  Min.   :0.000   Min.   :0.000   Min.   :0.000   Min.   :0.0000  
##  1st Qu.:1.000   1st Qu.:0.000   1st Qu.:0.000   1st Qu.:0.0000  
##  Median :1.000   Median :1.000   Median :1.000   Median :0.0000  
##  Mean   :0.752   Mean   :0.679   Mean   :0.724   Mean   :0.0995  
##  3rd Qu.:1.000   3rd Qu.:1.000   3rd Qu.:1.000   3rd Qu.:0.0000  
##  Max.   :1.000   Max.   :1.000   Max.   :1.000   Max.   :1.0000  
##     Cadillac          Chevy          Pontiac           Saab      
##  Min.   :0.0000   Min.   :0.000   Min.   :0.000   Min.   :0.000  
##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.000   1st Qu.:0.000  
##  Median :0.0000   Median :0.000   Median :0.000   Median :0.000  
##  Mean   :0.0995   Mean   :0.398   Mean   :0.187   Mean   :0.142  
##  3rd Qu.:0.0000   3rd Qu.:1.000   3rd Qu.:0.000   3rd Qu.:0.000  
##  Max.   :1.0000   Max.   :1.000   Max.   :1.000   Max.   :1.000  
##      Saturn        convertible         coupe         hatchback     
##  Min.   :0.0000   Min.   :0.0000   Min.   :0.000   Min.   :0.0000  
##  1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000  
##  Median :0.0000   Median :0.0000   Median :0.000   Median :0.0000  
##  Mean   :0.0746   Mean   :0.0622   Mean   :0.174   Mean   :0.0746  
##  3rd Qu.:0.0000   3rd Qu.:0.0000   3rd Qu.:0.000   3rd Qu.:0.0000  
##  Max.   :1.0000   Max.   :1.0000   Max.   :1.000   Max.   :1.0000  
##      sedan          wagon       
##  Min.   :0.00   Min.   :0.0000  
##  1st Qu.:0.00   1st Qu.:0.0000  
##  Median :1.00   Median :0.0000  
##  Mean   :0.61   Mean   :0.0796  
##  3rd Qu.:1.00   3rd Qu.:0.0000  
##  Max.   :1.00   Max.   :1.0000
```

In this dataset, the value of each variable is bounded and restricted as above. Thus, this application can only produce reasonable predictions for variables within some range, e.g. the input value of mileage should roubgly lie in [0,60000] to get confident results. 


## Application Guideline
*Step 1* Input the parameters of your car which include:
- car type: indicator representing type of your car such as convertible, coupe, hatchback, sedan and wagon
- car manufacturer: indicator representing manufacturer of your car such as Buick, Cadillac, etc. 
- Mileage: number of miles the car has been driven
- Cylinder: number of cylinders in the engine 
- Doors: number of doors 
- Cruise: indicator variable representing whether the car has cruise control (1 = cruise)
- Sound: indicator variable representing whether the car has upgraded speakers (1 = upgraded)
- Leather: indicator variable representing whether the car has leather seats (1 = leather)

Note: you can input some or all of the parameters before clicking the submit button to get the results. By default, your car is convertible Buick, with cruise control, upgraded speakers and leather seats. Once your typing is not non-negative integer or contains special characters, it is will be ignored automatically. 

*Step 2* Submit your task by clicking the "Submit" button at the left bottom.
The coefficients of each variable for your linear regression model will show up. This is followed by the valid input, which makes it easy for you to check your input. At last, the output price of your car is printed out with a residual plot to check for heteroskedasticity, normality, autocorrelation, and multicollinearity as well as explore techniques for variable selection and develop specially constructed 
variables.

Note: if you want to check the codes to generate this application, click the given links below:
- [codes](https://github.com/szywind/Project-shiny-app)

========================================================
## Reference
1. [Kuiper, S. (2008). Introduction to Multiple Regression: How Much Is Your Car Worth?, Journal of Statistics Education, Vol. 16](http://www.amstat.org/publications/jse/v16n3/kuiper.pdf)
2. [Shiny Tutorial](http://rstudio.github.io/shiny/tutorial)
