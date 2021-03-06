library(tidyverse)
data_flowers <- read_tsv("data/flowers.txt")

flowers_petal <- transmute(data_flowers,  length = data_flowers$Petal.Length, 
                           width = data_flowers$Petal.Width, Species = 
                            as.factor(data_flowers$Species), category = "Petal")

flowers_sepal <- transmute(data_flowers, length = data_flowers$Sepal.Length, 
                           width = data_flowers$Sepal.Width, Species = 
                           as.factor(data_flowers$Species), category = "Sepal")

flowers_exp <- bind_rows(flowers_petal, flowers_sepal)

flowers_exp %>% ggplot(aes(x=length, y=width, col = Species)) +  geom_point() + 
  facet_wrap(~category, scales = "free") + theme_bw() + geom_smooth(method = "lm", 
                                                                    fullrange = TRUE)


