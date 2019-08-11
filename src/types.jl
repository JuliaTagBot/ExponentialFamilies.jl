struct NaturalExponentialFamily{P,X}
    logh :: Function # :: X -> Real
    t    :: Function # :: X -> StaticVector{N, Real}
    a    :: Function # :: P -> Real
end

struct NatExpFamDist{P,X}
    fam :: NaturalExponentialFamily{P,X}
    a :: Real
    η :: P
end

export logpdf
function logpdf(d::NatExpFamDist{P,X}, x::X)::Real where {P,X} 
    d.fam.logh(x) + d.η ⋅ d.fam.t(x) - d.a
end

function (fam::NaturalExponentialFamily{P,X})(η::P) where {P,X}
    NatExpFamDist{P,X}(fam, fam.a(η), η)
end