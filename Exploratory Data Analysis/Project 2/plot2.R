#Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.answering this question?

NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
total_NEI <- NEI[fips=='24510', lapply(.SD, sum, na.rm = TRUE)
                , .SDcols = c("Emissions")
                , by = year]

png(filename='plot2.png')

barplot(total_NEI[, Emissions]
        , names = total_NEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years", col = 'skyblue')

dev.off()
