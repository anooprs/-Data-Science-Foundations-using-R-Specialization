#Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

combustion_Related <- grepl("comb", SCC[, SCC.Level.One], ignore.case=TRUE)
coal_Related <- grepl("coal", SCC[, SCC.Level.Four], ignore.case=TRUE) 
combustion_SCC <- SCC[combustion_Related & coal_Related, SCC]
combustion_NEI <- NEI[NEI[,SCC] %in% combustion_SCC]

png("plot4.png")

ggplot(combustion_NEI,aes(x = factor(year),y = Emissions/10^5)) +
  geom_bar(stat="identity", fill ="#FF9999", width=0.75) + theme_minimal() + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
