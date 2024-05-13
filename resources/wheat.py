from alinea.adel.astk_interface import AdelWheat
adel = AdelWheat(nsect=7)
g= adel.setup_canopy(100)
g = adel.grow_dd(g,300)
adel.plot(g)

from alinea.adel.mtg import duplicate, planter

stands = [(x, y) for x in range(0,3) for y in range(3)]

g = duplicate(g, n=len(stands))
planter(g, stands)

adel.plot(g)