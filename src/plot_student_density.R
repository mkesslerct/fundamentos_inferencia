
pdf(
    "lecture_notes/figures/densidad_student.pdf",
    onefile = FALSE,
    height = 8,
    width = 10
)
par(cex = 1.2)
x <- seq(-6, 6, by = 0.01)
y1 <- dt(x, df = 1)
y3 <- dt(x, df = 3)
y10 <- dt(x, df = 10)
y30 <- dt(x, df = 30)
y150 <- dt(x, df = 150)
plot(
    x,
    y150,
    type = "n",
    axes = F,
    xlab = "t",
    ylab = expression(paste(f[g],"(t)")),
    xlim = c(-6, 6)
)
axis(2, at = seq(0, 1, by = 0.2), pos = 0, las = 1, labels = rep("", 6))
axis(1, at = seq(-6, 6, by = 0.5), labels = c(rep("", 25)), pos = 0)
lines(x, y1, lwd = 2)
lines(x, y3, lwd = 2, col = "green")
lines(x, y10, lwd = 2, col = "red")
#lines(x, y30)
lines(x, y150, lwd = 2, , col = "blue")
legend(
    x = 3,
    y = 0.3,
    legend = c("g = 1", "g = 3", "g = 3", "g = 150"),
    col = c("black", "green", "red", "blue"),
    lwd = rep(2, 4)
)
dev.off()
library(purrr)
library(ggplot2)

df = c(1, 3, 10, 30, 150)
x <- seq(-6, 6, by = 0.01)
densidad <- map_dfr(df, ~ data.frame(x = x, y = dt(x, df = .), df = .))

densidad |>
    ggplot(aes(x, y, col=factor(df))) +
    geom_line() +
    labs(x = "t", y = expression(paste(f[g],"(t)"))) +
    scale_color_discrete(name = "Grados de libertad (g)")
           


