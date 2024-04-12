use "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles\spmatrix.dta" 
cd "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles"
spset
xtset id year
spset
list _ID year in 1/8, sepby(_ID)
xtset _ID year
spset
xtreg CARBON logTR logEPM logEPVA Green POP interaction, re
xtreg CARBON logTR logEPM logEPVA Green POP interaction i.year, re
spmatrix create idistance if year==1990
spmatrix create idistance W if year==1990
spxtregress CARBON logTR logEPM logEPVA Green POP interaction i.year, re dvarlag(W) errorlag(W)
spxtregress CARBON logTR logEPM logEPVA Green POP logHC interaction i.year, re dvarlag(W) errorlag(W)

help xtmoran
 xtmoran CARBON, wname(W.dta) morani(2012 2013 2014 2015) graph
 xtmoran CARBON, wname(W1.dta) morani(2012 2013 2014 2015) graph
use "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles\W1.dta"
 xtmoran CARBON, wname(W1.dta) morani(2012 2013 2014 2015) graph
use "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles\spmatrix.dta" 

xtreg CARBON logTR logEPM logEPVA Green POP logHC interaction i.year, re
spmatrix create idistance Wi if year==1990
spxtregress CARBON logTR logEPM logEPVA Green POP interaction i.year, re dvarlag(Wi) errorlag(Wi)
spxtregress CARBON logTR logEPM logEPVA Green POP logHC interaction i.year, re dvarlag(Wi) errorlag(Wi)

xtmoran CARBON, wname(w.dta) morani(2012 2013 2014 2015) graph

help xtmoran
help moransi

moransi CARBON if countryname=="Algeria", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km)
moransi CARBON if countryname=="Algeria", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
help spmap
spmap carbon using "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles"
spmap carbon using "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles", id(_ID)
spmap carbon using "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles", id(_ID)
xtmoran CARBON if _regionname=="Sub-Saharan Africa" wname(w.dta) morani(2012 2013 2014 2015)
moransi CARBON if _regionname=="Sub-Saharan Africa", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
moransi CARBON if _regionname=="Europe and Central Asia", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
br
moransi CARBON if _regionname=="Middle East and North Africa", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(10) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(1) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(1) dunit(miles) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(1) dunit(mi) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(0.5) dunit(mi) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(0.5) dunit(mi) approx gen
drop splag_CARBON_b
moransi CARBON if countryname=="Ghana", lat( _CY ) lon( _CX ) swm(bin) dist(0.5) dunit(mi) approx gen

spxtregress CARBON logTR logEPM logEPVA Green POP interaction i.year, re dvarlag(W) errorlag(W)
estat moran

help estat moran

estat moran, errorlag(w)
regress CARBON logTR logEPM logEPVA Green POP interaction i.year
estat moran, errorlag(W)

xtmoran y, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran CARBON, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran carbonKt, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran EPVA, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran CropPI, wname(w.dta) morani(1990 2000 2010 2020)

help spmatrix
 
 spmatrix create idistance W2, normalize(minmax)
 spmatrix create idistance W2 if year==1990, normalize(minmax)
xtmoran CropPI, wname(W2.dta) morani(1990 2000 2010 2020)

help spmatrix
 
spmatrix export spmatname using W2
spmatrix export W2 using W2

xtmoran CropPI, wname(W2.dta) morani(1990 2000 2010 2020)
xtmoran CropPI, wname(W2.dta) morani(1990 2000 2010 2020) graph
regress CARBON logTR logEPM logEPVA Green POP interaction i.year
spatdiag, weights(w)
spatwmat, mame(w3) xcoord( _CX) ycoord( _CY) band(0 60) eigenval(E) binary
spatwmat, name(w3) xcoord( _CX) ycoord( _CY) band(0 60) eigenval(E) binary
spatdiag, weights(w3)
regress CARBON logTR logEPM logEPVA Green POP interaction
spatdiag, weights(w3)
xtmoran CropPI, wname(W2.dta) morani(1997 2001 2003 2004 2006 2007 2008 2011 2012) graph
xtmoran hc, wname(W2.dta)
morani(1997 2001 2003 2004 2006 2007 2008 2011 2012) graph
xtmoran CropPI, wname(W2.dta)
xtmoran EPM, wname(W2.dta)
xtmoran EPVA, wname(W2.dta)
use "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles\spmatrix.dta" 
cd "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles"
spset
xtset id year
spset
list _ID year in 1/8, sepby(_ID)
xtset _ID year
spset
xtreg CARBON logTR logEPM logEPVA Green POP interaction, re
xtreg CARBON logTR logEPM logEPVA Green POP interaction i.year, re
spmatrix create idistance if year==1990
spmatrix create idistance W if year==1990
spxtregress CARBON logTR logEPM logEPVA Green POP interaction i.year, re dvarlag(W) errorlag(W)
spxtregress CARBON logTR logEPM logEPVA Green POP logHC interaction i.year, re dvarlag(W) errorlag(W)
help xtmoran
 xtmoran CARBON, wname(W.dta) morani(2012 2013 2014 2015) graph
 xtmoran CARBON, wname(W1.dta) morani(2012 2013 2014 2015) graph
use "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles\W1.dta"
 xtmoran CARBON, wname(W1.dta) morani(2012 2013 2014 2015) graph
use "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles\spmatrix.dta" 
xtset id year
spset
list _ID year in 1/8, sepby(_ID)
xtset _ID year
spset
xtreg CARBON logTR logEPM logEPVA Green POP logHC interaction i.year, re
spmatrix create idistance Wi if year==1990
spxtregress CARBON logTR logEPM logEPVA Green POP interaction i.year, re dvarlag(Wi) errorlag(Wi)
spxtregress CARBON logTR logEPM logEPVA Green POP logHC interaction i.year, re dvarlag(Wi) errorlag(Wi)
 xtmoran CARBON, wname(w.dta) morani(2012 2013 2014 2015) graph
 xtmoran CARBON, wname(W.dta) morani graph
 xtmoran CARBON, wname(W.dta) morani(year) graph
 xtmoran CARBON, wname(W.dta) morani(year*) graph
 xtmoran CARBON, wname(W.dta)
help xtmoran
help moransi
moransi CRIME, lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km)
moransi CARBON , lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km)
moransi CARBON hc , lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km)
moransi CARBON if countryname=="Algeria", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km)
moransi CARBON if countryname=="Algeria", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
help spmap
spmap carbon using "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles"
spmap carbon using "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles", id(_ID)
spmap carbon using "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles", id(_ID)
xtmoran CARBON if _regionname=="Sub-Saharan Africa" wname(w.dta) morani(2012 2013 2014 2015)
moransi CARBON if _regionname=="Sub-Saharan Africa", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
moransi CARBON if _regionname=="Europe and Central Asia", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
br
moransi CARBON if _regionname=="Middle East and North Africa", lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(10) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(1) dunit(km) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(1) dunit(miles) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(1) dunit(mi) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(0.5) dunit(mi) approx
moransi CARBON if countryname=="South Africa", lat( _CY ) lon( _CX ) swm(bin) dist(0.5) dunit(mi) approx gen
drop splag_CARBON_b
moransi CARBON if countryname=="Ghana", lat( _CY ) lon( _CX ) swm(bin) dist(0.5) dunit(mi) approx gen
spxtregress CARBON logTR logEPM logEPVA Green POP interaction i.year, re dvarlag(W) errorlag(W)
estat moran
help estat moran
estat moran, errorlag(w)
regress CARBON logTR logEPM logEPVA Green POP interaction i.year
estat moran, errorlag(W)
xtmoran y, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran CARBON, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran carbonKt, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran EPVA, wname(w.dta) morani(1990 2000 2010 2020)
xtmoran CropPI, wname(w.dta) morani(1990 2000 2010 2020)
help spmatrix
 spmatrix create idistance W2, normalize(minmax)
 spmatrix create idistance W2 if year==1990, normalize(minmax)
xtmoran CPI, wname(W2.dta) morani(1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020) graph
help spmatrix
 spmatrix export spmatname using W2
 spmatrix export W2 using W2
xtmoran CropPI, wname(W2.dta) morani(1990 2000 2010 2020)
xtmoran CPI, wname(W2.dta)  graph
regress CARBON logTR logEPM logEPVA Green POP interaction i.year
spatdiag, weights(w)

spatwmat, name(w3) xcoord( _CX) ycoord( _CY) band(0 60) eigenval(E) binary
spatdiag, weights(w3)

regress CARBON logTR logEPM logEPVA Green POP interaction
spatdiag, weights(w3)
xtmoran CropPI, wname(W2.dta) morani(1997 2001 2003 2004 2006 2007 2008 2011 2012) graph
xtmoran hc, wname(W2.dta)
morani(1997 2001 2003 2004 2006 2007 2008 2011 2012) graph
xtmoran CropPI, wname(W2.dta)
xtmoran EPM, wname(W2.dta)
xtmoran EPVA, wname(W2.dta)
moransi hc
moransi CARBON, lat( _CY ) lon( _CX ) swm(bin) dist(60) dunit(km) approx
xtmoran logEPVA, wname(W2.dta)
xtmoran log logEPM, wname(W2.dta)
xtmoran logEPM, wname(W2.dta)
xtmoran logTR, wname(W2.dta)
xtmoran logHC, wname(W2.dta)
xtmoran logCPI, wname(W2.dta)
xtmoran CPI, wname(W2.dta)

spmap go_z_logEPM_b using "world_coordinates.dta", id(id)          ///
        title("zscores", size(*0.8))         ///
        subtitle("spatialanalysis" " ", size(*0.8)) 
		
use "world_coordinates.dta", clear
spmap  go_z_logEPM_b using "world_coordinates.dta", id(id) fcolor(Terrain) clmethod(eqint) clnumber(5)  title("Mapping Getisord", size(*0.8)) subtitle("median of emissions per pesticide manufacturing" " ", size(*0.8)) legstyle(2) 

\use "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\getisord.dta" 
cd "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\translated shapefiles"
spmap go_z_logEPM_b using "world_coordinates"
spmap go_z_logEPM_b using "world_coordinates", id( id)
help getisord
 
getisord TR, lat( _CY ) lon( _CX ) swm(exp 0.03) dist(60) dunit(km) approx detail
spmap go_z_TR_e using "world_coordinates", id( id)

getisord Green, lat( _CY ) lon( _CX ) swm(exp 0.03) dist(60) dunit(km) approx detail
spmap go_z_Green_e using "world_coordinates", id( id)
 
getisord POP, lat( _CY ) lon( _CX ) swm(exp 0.03) dist(60) dunit(km) approx detail

help spmap

spmap go_z_POP_e using "world_coordinates", id( id) fcolor(Oranges)
spmap go_z_POP_e using "world_coordinates", id( id) fcolor(Oranges) label(kilometers)
spmap go_z_POP_e using "world_coordinates", id( id) fcolor(Oranges) label(kilometres)
spmap go_z_POP_e using "world_coordinates", id( id) fcolor(Oranges) label(km)
spmap go_z_POP_e using "world_coordinates", id( id) fcolor(Oranges) scale(1/1000)
spmap go_z_POP_e using "world_coordinates", id( id) fcolor(Oranges)
 
 getisord EPVA, lat( _CY ) lon( _CX ) swm(exp 0.03) dist(60) dunit(km) approx detail

 spmap go_z_EPVA_e using "world_coordinates", id( id) fcolor( Purples )
spmap go_z_EPVA_e using "world_coordinates", id( id) fcolor(Terrain)
spmap go_z_EPVA_e using "world_coordinates", id( id) fcolor(Topological)
spmap go_z_EPVA_e using "world_coordinates", id( id) fcolor(BuYlRd)
spmap go_z_EPVA_e using "world_coordinates", id(id) clm(custom) clb(-2.58  -1.96 1.96 2.58)  fcolor(ebblue eltblue white orange red) legtitle("{it: z}-value") legstyle(1) legcount legend(size(*1.8))

spmap go_z_EPVA_e using "world_coordinates", id(id) clm(custom) clb(-2.58 -2.58 -1.96 1.96 2.58)  fcolor(ebblue eltblue white orange red) legtitle("{it: z}-value") legstyle(1) legcount legend(size(*1.8))

spmap go_z_EPVA_e using "world_coordinates", id(id) clm(custom) clb(-2.58 -1.96 1.96 2.58)  fcolor(greyscale 12 greyscale 8 white greyscale 6   greyscale 4) legtitle("{it: z}-value") legstyle(1) legcount legend(size(*1.8))


spmap go_z_EPVA_e using "world_coordinates", id(id) clm(custom) clb(-100 -2.576 -1.960 1.960 2.576 100)  fcolor(ebblue eltblue white orange red) legtitle("{it: z}-value") legstyle(1) legcount legend(size(*1.8))

save "C:\Users\Frank Osei-kusi\Desktop\spatial assessment\getisord.dta", replace

