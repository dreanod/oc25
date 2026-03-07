library(jsonlite)
library(tidyverse)
library(scales)

wiki <- jsonlite::fromJSON("wikipedia.json")
wiki <- as_tibble(wiki$data)
colnames(wiki) <- c("time", "article")

wiki$time <- lubridate::ym(wiki$time)
wiki$article <- as.double(wiki$article)
wiki$source <- "wiki"


brit <- as_tibble(list(
  time = lubridate::ym(c("2001-01", "2006-01", "2010-1")),
  article = c(65000, 100000, 120000),
  source = "brit"
))


data <- rbind(brit, wiki)



p <- data |>
  ggplot(aes(time, article, color=source)) +
  geom_line() +
  scale_color_manual(
    values = c("red", "blue"),
    labels = c("Britannica", "Wikipedia")
  ) + 
  coord_cartesian(
    xlim = c(ym("2001-01", "2008-01")),
    ylim = c(-1e4, 2.05e6)
  ) + 
  scale_x_date(
    date_breaks = "1 year",
    date_minor_breaks = "1 month",
    date_labels = "%Y",
    expand = c(0,0)
  ) +   scale_y_continuous(
    labels = label_number(scale = 1e-6, suffix = "M"),
    minor_breaks = scales::minor_breaks_n(10),
    expand = c(0,0)
  ) + 
  theme_light() + 
  ylab("Artikelzahl (in Millionen)") + 
  labs(x = NULL) + 
  theme(legend.title = element_blank())
