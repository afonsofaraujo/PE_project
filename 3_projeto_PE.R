library(tidyverse)

url <- "https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/GENDER_EMP_19032023152556091.txt"

# Data filtering
df <- read.csv(url, header = TRUE, sep = "\t") %>% 
  filter(Country == "Spain") %>% 
  filter(IND == "EMP5") %>% 
  filter(TIME == "2019") %>% 
  filter(Sex == "Men" | Sex == "Women") %>% 
  filter(Age.Group != "Total")

# Plot
ggplot(df, aes(x = Age.Group, y = Value, fill = Sex)) +
geom_bar(stat = "identity", position = "dodge", alpha = 0.7) +
labs(x = "Age Group", y = "Share of employed in part-time employment (%)", title = "Share of employed in part-time employment in Spain in 2019") +
theme_minimal()
