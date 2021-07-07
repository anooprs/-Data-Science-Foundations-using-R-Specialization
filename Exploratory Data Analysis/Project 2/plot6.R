#Question 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

condition <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehicles_SCC <- SCC[condition, SCC]
vehicles_NEI <- NEI[NEI[, SCC] %in% vehicles_SCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
vehiclesBaltimore_NEI <- vehicles_NEI[fips == "24510",]
vehiclesBaltimore_NEI[, city := c("Baltimore City")]

vehiclesLA_NEI <- vehicles_NEI[fips == "06037",]
vehiclesLA_NEI[, city := c("Los Angeles")]

# Combine data.tables into one data.table
both_NEI <- rbind(vehiclesBaltimore_NEI,vehiclesLA_NEI)

png("plot6.png")

ggplot(both_NEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") + theme_minimal() +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))



dev.off()
