# ---------------------------------------------------------------------------- #
#
#   wrapEgads.jl
#
#   Generates the files in wrapped_api/.
#
#   This script follows the C-wrapping of the Sundials.jl package
#
#   This script is not an active part of the package.
#   The Clang.jl package is used to wrap the egads API.
#
#   To run the script from Julia console:
#     include(joinpath(Pkg.dir("egads"), "src", "wrap_egads.jl"));
#   Note that you really should not have to do this, this script is just
#   provided for completeness.
#
#   egads.jl
#   Spring 2018
#
#   Max Opgenoord
#
# ---------------------------------------------------------------------------- #

using Clang.wrap_c

# Input parameters
const egadspath = "/home/mopg/code/EngSketchPad"

# `outpath` specifies, where the julia wrappers would be generated.
# If the generated .jl files are ok, they have to be copied to the "wrapped_api"
# in the "src/" folder overwriting the old ones
const outpath = normpath( joinpath(dirname(@__FILE__), "new") )
mkpath(outpath)

# Find all relevant egads headers
const incpath = normpath( joinpath(egadspath, "include") )
if !isdir(incpath)
    error("Egads C headers not found. You need to install Engineering Sketch Pad (ESP) first")
end

info("Scanning EGADS headers in $incpath...")

const egads_headers = ["common.h","egads.h","egadsBlendSens.h","egadsErrors.h",
                          "egadsSplineFit.h","egadsTris.h",
                          "egadsTypes.h","egg.h","emp.h","prm.h"]

kk = 1
for folder in egads_headers
    egads_headers[kk] = joinpath( incpath, egads_headers[kk] )
    kk += 1
end

const clang_path = "/usr/lib/clang/3.8.0" # change to your clang location
const clang_includes = [
    joinpath(clang_path, "include"),
]

# Callback to test if a header should actually be wrapped (for exclusion)
function wrap_header(top_hdr::AbstractString, cursor_header::AbstractString)
    (top_hdr == cursor_header) # don't wrap if header is included from the other
                               #   header (e.g. nvector in cvode or cvode_direct
                               #   from cvode_band)
end

function julia_file(header::AbstractString)
    src_name = basename(dirname(header))
    if src_name == "egads"
        src_name = "libegads" # avoid having both egads.jl and egads.jl
    end
    return joinpath(outpath, string(src_name, ".jl"))
end
function library_file(header::AbstractString)
    header_name = basename(header)
    return string("libegads_", basename(dirname(header)))
end

const contxt = wrap_c.init(
    common_file = joinpath(outpath, "types_and_consts.jl"),
    clang_diagnostics = true,
    clang_includes = [clang_includes; incpath],
    header_outputfile = julia_file,
    header_library = library_file,
    header_wrapped=wrap_header
)
contxt.headers = egads_headers

run(contxt)

# NOTE: in the generated files
#   $(Expr(:typealias, :ego, :(Ptr{egObject})))
# needs to be replaced with
#   const ego = Ptr{egObject}
# and something is complaining about FILE, just comment it out
#
# Furthermore, the const error codes need to Int32
