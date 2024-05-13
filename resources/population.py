from alinea.adel.mtg import duplicate, planter

stands = [(x, y) for x in range(0,3) for y in range(3)]

g = duplicate(g, n=len(stands))
planter(g, stands)

adel.plot(g)