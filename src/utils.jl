# This file is a part of AstroLib.jl. License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

using Base.Dates

include("adstring.jl")
export adstring

include("airtovac.jl")
export airtovac

include("aitoff.jl")
export aitoff

include("altaz2hadec.jl")
export altaz2hadec

include("calz_unred.jl")
export calz_unred

include("ct2lst.jl")
export ct2lst

include("daycnv.jl")
export daycnv

include("deredd.jl")
export deredd

include("eqpole.jl")
export eqpole

include("flux2mag.jl")
export flux2mag

include("get_date.jl")
export get_date

include("get_juldate.jl")
export get_juldate

include("gcirc.jl")
export gcirc

# TODO: this function requires "bprecess" and "xyz".
# include("helio_jd.jl")
# export helio_jd

include("jdcnv.jl")
export jdcnv

include("juldate.jl")
export juldate

include("kepler_solver.jl")
export kepler_solver

include("mag2flux.jl")
export mag2flux

include("polrec.jl")
export polrec

include("precess.jl")
export precess

include("precess_xyz.jl")
export precess_xyz

include("premat.jl")
export premat

include("radec.jl")
export radec

include("recpol.jl")
export recpol

include("rhotheta.jl")
export rhotheta

include("sixty.jl")
export sixty

include("sphdist.jl")
export sphdist

include("ten.jl")
export ten, tenv

include("vactoair.jl")
export vactoair

include("xyz.jl")
export xyz

include("ydn2md.jl")
export ydn2md

include("ymd2dn.jl")
export ymd2dn
