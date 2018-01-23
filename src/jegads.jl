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
    const libegads_include = "/Users/Max/Code/ESP112/EngSketchPad/lib/libegads.dylib"
elseif Compat.Sys.islinux()
    const libegads_include = "/home/mopg/code/EngSketchPad/lib/libegads.so"
else
    error("Unsupported operating system")
end

# include wrapper

include("wrapped_api/types_and_consts.jl")
include("wrapped_api/include.jl")

include("export.jl")

# include added functions
export cleanup
include("cleanup.jl")

end
