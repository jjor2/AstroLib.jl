# This file is a part of AstroLib.jl. License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

"""
    calz_unred(wave, flux, ebv[, r_v]) -> Float64

### Purpose ###

Deredden a galaxy spectrum using the Calzetti et al. (2000) recipe.

### Explanation ###

Calzetti et al.  (2000, ApJ 533, 682;
http://adsabs.harvard.edu/abs/2000ApJ...533..682C) developed a recipe for
dereddening the spectra of galaxies where massive stars dominate the radiation
output, valid between 0.12 to 2.2 microns.  (`calz_unred` extrapolates between
0.12 and 0.0912 microns.)

### Arguments ###

* `wave`: wavelength vector (Angstroms)
* `flux`: calibrated flux vector, same number of elements as `wave`.
* `ebv`: color excess E(B-V), scalar.  If a negative `ebv` is supplied, then
  fluxes will be reddened rather than deredenned.  Note that the supplied color
  excess should be that derived for the stellar continuum, EBV(stars), which is
  related to the reddening derived from the gas, EBV(gas), via the Balmer
  decrement by EBV(stars) = 0.44*EBV(gas).
* `r_v` (optional): scalar ratio of total to selective extinction, default =
 4.05.  Calzetti et al. (2000) estimate r_v = 4.05 +/- 0.80 from optical-IR
 observations of 4 starbursts.

### Output ###

Unreddened flux vector, same units and number of elements as `flux`.  Flux
values will be left unchanged outside valid domain (0.0912 - 2.2 microns).

### Example ###

Estimate how a flat galaxy spectrum (in wavelength) between 1200 Å and 3200 Å is
altered by a reddening of E(B-V) = 0.1.

``` julia
julia> wave = reshape(1200:50:3150,40);

julia> flux = ones(wave);

julia> AstroLib.calz_unred(wave, flux, -0.1);
```

### Notes ###

Code of this function is based on IDL Astronomy User's Library.
"""
function calz_unred(wave::Number, flux::Number, ebv::Number, r_v::Number=4.05)
    x  = 10000.0/wave # Wavelength in inverse microns
    klam = 0.0
    if 6300.0 <= wave <= 22000.0
        klam = 2.659*(-1.857 + 1.040*x) + r_v
    elseif 912.0 <= wave < 6300.0
        klam = 2.659*(@evalpoly(x, -2.156, 1.509, -0.198, 0.011)) + r_v
    end
    return flux*10.0^(0.4*klam*ebv)
end
function calz_unred{W<:Number, F<:Number}(wave::AbstractArray{W},
                                          flux::AbstractArray{F},
                                          ebv::Number, r_v::Number=4.05)
    @assert length(wave) == length(flux)
    flux_unred  = similar(flux, Float64)
    for i in eachindex(flux)
        flux_unred[i] = calz_unred(wave[i], flux[i], ebv, r_v)
    end
    return flux_unred
end
