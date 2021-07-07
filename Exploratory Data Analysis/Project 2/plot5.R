#Question 5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

condition <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehicles_SCC <- SCC[condition, SCC]
vehicles_NEI <- NEI[NEI[, SCC] %in% vehicles_SCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehicles_NEI <- vehicles_NEI[fips=="24510",]

png("plot5.png")

ggplot(baltimoreVehicles_NEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill ="#FF9999" ,width=0.75) + theme_minimal() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()
