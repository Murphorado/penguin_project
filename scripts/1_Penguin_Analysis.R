install.packages("tidyverse")
library(tidyverse)
penguins <- read_table("data/penguin_data.txt")
View(penguins)
bill_length_model <- lm(bill_length_mm~species, data=penguins)
summary(bill_length_model)

ggplot(data=penguins, aes(x=species, y=bill_length_mm) + geom_point())

ggplot() +
  geom_point(mapping = aes(x = species, y = bill_length_mm), data = penguins) +
  geom_point(
    mapping = aes(x = species, y = bill_length_mm), data = group_means_df,
    colour = 'red', size = 3)

boxplot(bill_length_mm ~ species, data = penguins, col = "lightgray")

model1 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(model1)

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  stat_smooth(method = "lm") 

ggsave("figs/1_flipper_bodymass_regression.png") 

#NB. This saves the last plot that was run!

penguins_female <- subset(penguins, sex == "female")
write_tsv(penguins_female, "results/1_penguin_female_only.txt")
#added a comment
