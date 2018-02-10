# ---------------------------------------------------------------------------- #
#
#   jegads.jl
#
#   Julia wrapper for egads (part of Engineering Sketch Pad)
#
#   jegads
#   Spring 2018
#
#   Max Opgenoord
#
# ---------------------------------------------------------------------------- #

__precompile__()

"""
    sterno

Julia wrapper for egads (part of Engineering Sketch Pad)

Max Opgenoord

Spring 2018
"""
module jegads

import Compat

# find egads library file
if Compat.Sys.isapple()
    ext = ".dylib"
elseif Compat.Sys.islinux()
    ext = ".so"
else
    error("Unsupported operating system")
end
libname      = string("libegads", ext)
commonlocesp = ["Code/ESP112/","code/","Code/"]
libdir       = "EngSketchPad/lib"
commonloc    = similar(commonlocesp)
for jj in 1:length(commonloc)
    commonloc[jj] = joinpath(homedir(),commonlocesp[jj],libdir)
end
libfind = Base.Libdl.find_library( libname, commonloc )
if isempty(libfind)
    error("EGADS library not found, update the location in jegads.jl or update commonlocesp")
else
    const libegads_include = libfind
end

# include wrapper

include("wrapped_api/types_and_consts_egads.jl")
include("wrapped_api/include_egads.jl")

include("export.jl")

# include added functions
include("added_functionality.jl")

end
