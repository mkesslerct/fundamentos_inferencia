library(tidyverse)
alpha <- 0.05
phi  <- tibble::tibble(
    x = seq(-5, 5, by = 0.01),
    y = dt(x, df = 10)
)
vertices <- phi %>%
   filter(between(x, qt(alpha/2, 10), qt(1 - alpha/2, 10)))   

phi %>%
    ggplot(aes(x, y)) +
    geom_line() +
    geom_area(data = vertices, alpha = 0.5)
plot(x, phi, type="l", xlab="", ylab="", axes=FALSE)
 polygon(vertices.x, vertices.y, density=10)
 axis(
     1,
     pos=0,
     labels=c(
         "",
         expression(-t[{n-1}*symbol("\054")*{1-alpha/2}]),
         "",
         expression(t[{n-1}*symbol("\054")*{1-alpha/2}]),
         ""
     ),
     at=c(-5, qt(alpha/2, 10), 0, qt(1-alpha/2, 10), 5)
)
