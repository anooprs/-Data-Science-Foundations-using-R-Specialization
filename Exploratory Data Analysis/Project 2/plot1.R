library(data.table)
library(ggplot2)

SCC <- as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

#Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008?

NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

total_NEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

barplot(total_NEI[, Emissions]
        , names = total_NEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years", col = 'aquamarine4')

png(filename='plot1.png')
        
dev.off()
