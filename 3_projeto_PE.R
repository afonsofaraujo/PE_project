library(tidyverse)
url <- "https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/GENDER_EMP_19032023152556091.txt"
# Data filtering
df <- read.csv(url, header = TRUE, sep = "\t") %>% 
  filter(Country == "Canada") %>% 
  filter(IND == "EMP3") %>% 
  filter(TIME == "2010") %>% 
  filter(Sex == "Men" | Sex == "Women") %>% 
  filter(Age.Group != "Total")
# Plot
ggplot(df, aes(x = Age.Group, y = Value, fill = Sex)) +
geom_bar(stat = "identity", position = "dodge", alpha = 0.7) +
labs(x = "Age Group", y = "Unemployment rate (%)", title = "Unemployment rate by sex and age group in Canada in 2010") +
theme_minimal()
