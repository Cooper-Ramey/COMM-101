library(marinecs100b)
library(ggplot2)


# Distributions of continuous variables -----------------------------------

# P1 What type of visualization is appropriate for a single continuous variable?
#Histograms

# P2 What type of visualization is appropriate for a continuous variable across
# categorical variables?
#Boxplots

# P3 Use ggplot to visualize the distribution of sea surface salinity. Save your
# figure as “comm101p3.png”.

View(woa_sal)


ggplot(woa_sal, aes(x = salinity)) +
  geom_histogram()
ggsave("comm101p3.png")

# P4 Use ggplot to visualize the distribution of sea surface salinity by ocean
# basin. Save your figure as “comm101p4.png”.


ggplot(woa_sal, aes(x = ocean, y = salinity)) +
  geom_boxplot()
ggsave("comm101p4.png")


# P5 Interpret your figures from P3 and P4. What patterns do you notice?
#The histogram shows that the average salinity of all ocean samples is around 35-36.
#The boxplot shows a similar trend, but let's us see the means and quartiles for
#each ocean individually, and points out outliers.

# P6 Critique your figures from P3 and P4. What changes would highlight the
# patterns you interpreted in P5? You don’t need to write code for these
# changes, just describe them verbally.

#We can adjust the frame for the histogram to enlarge the data. We can also put
#units on our axis to make the graph more clear

# Relationships between continuous variables ------------------------------


# P7 Visualize the relationship between salinity and latitude by ocean basin.

ggplot(woa_sal, aes(x = latitude, y = salinity)) +
  geom_point()


# P8 Edit your figure from P7 to improve its interpretability in at least one of
# the following categories: visually differentiating the oceans, appropriateness
# of the labels, or use of negative space. Save this figure as “comm101p8.png”.
best_theme <- c("#050F51","#45f","#5762c1","#15FFf7")
worst_theme <- c("#f7c424","#009323","#e2cdea","#ff00dc")
ggplot(woa_sal, aes(x = salinity, y = latitude, color = ocean)) +
  geom_point() +
  scale_color_manual(values = best_theme) +
  labs(x = "Salinity(ppt)", y = "Latitude(*)", color = "Ocean") +
  theme_bw() +
  theme(legend.position = "inside",
        legend.position.inside = c(0.3, 0.5))


ggsave("comm101p8.png")
