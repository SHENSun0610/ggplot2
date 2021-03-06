vcontext("coord-polar")

dat <- data.frame(x = 0:1, y = rep(1:80, each = 2))

ggplot(dat, aes(x, y, group = factor(y))) + geom_line() + coord_polar()
save_vtest("Concentric circles at theta = 1:80")

ggplot(dat, aes(x, y - 80, group = factor(y))) + geom_line() + coord_polar()
save_vtest("Concentric circles at theta = 1:80 - 80")

ggplot(dat, aes(x, y - 40, group = factor(y))) + geom_line() + coord_polar()
save_vtest("Concentric circles at theta = 1:80 - 40")

ggplot(dat, aes(x, y + 100, group = factor(y))) + geom_line() + coord_polar()
save_vtest("Concentric circles at theta = 1:80 + 100")

ggplot(dat, aes(x, y * 100, group = factor(y))) + geom_line() + coord_polar()
save_vtest("Concentric circles at theta = 1:80 * 100")


dat <- data.frame(
  theta = c(0, 2*pi,   2,   6, 6, 1,    1,  0),
  r     = c(0,    0, 0.5, 0.5, 1, 1, 0.75, .5),
  g     = 1:8)
ggplot(dat, aes(theta, r, colour = g)) + geom_path() +
  geom_point(alpha = 0.3, colour = "black") + coord_polar()
save_vtest("Rays, circular arcs, and spiral arcs")


dat <- data.frame(x = LETTERS[1:6], y = 11:16)
ggplot(dat, aes(x, y)) + geom_bar(stat = "identity") + coord_polar()
save_vtest("rose plot with has equal spacing")

ggplot(dat, aes(as.numeric(x), y)) + geom_point() + coord_polar()
save_vtest("continuous theta has merged low/high values")

ggplot(dat, aes(as.numeric(x), y)) + geom_point() + coord_polar() +
  xlim(0, 6) + ylim(0,16)
save_vtest("continuous theta with xlim(0, 6) and ylim(0, 16)")

ggplot(dat, aes(x, y)) + geom_bar(stat = "identity") + coord_polar(theta = "y")
save_vtest("racetrack plot with expand=F is closed and doesn't have center hole")

ggplot(dat, aes(x, y)) + geom_bar(stat = "identity") + coord_polar(theta = "y") +
  scale_x_discrete(expand = c(0, 0.6))
save_vtest("racetrack plot with expand=T is closed and has center hole")

end_vcontext()
