# ---------------------------------------------------------------------------- #
#
#   added_functionality.jl
#
#   Additional functions that make using egads from julia more straightforward.
#
#   jegads
#   Spring 2018
#
#   Max Opgenoord
#
# ---------------------------------------------------------------------------- #

"""
    eg_open( )

Opens an `egads` context.
"""
function eg_open( )
    ptr_obj = Ref{ego}()
    status = ccall((:EG_open, libegads_include), Cint, (Ptr{ego},), ptr_obj)
    return (ptr_obj[], status)
end

"""
    solidBoolean(src::ego, tool::ego, oper::Cint )

Performs a Boolean operation on the `ego` objects `src` and `tool`. `oper`
specifies the type of Boolean operation, such as `FUSION`, `INTERSECTION`, etc.
"""
function solidBoolean(src::ego, tool::ego, oper::Cint )
    model_ptr = Ref{ego}()
    status = ccall((:EG_solidBoolean, libegads_include), Cint, (ego, ego,
                Cint, Ptr{ego}), src, tool, oper, model_ptr)
    return (model_ptr[], status)
end

"""
    makeSolidBody(context::ego, stype::Cint, rvec)

Makes a solid object. `context` is the current egads context, `stype` specifies
the type of object, e.g. CYLINDER, SPHERE, etc. `rvec` is an array which holds
the data defining the object.
"""
function makeSolidBody(context::ego, stype::Cint, rvec)
    body_ptr = Ref{ego}()
    status = ccall((:EG_makeSolidBody, libegads_include), Cint, (ego, Cint,
                Ptr{Cdouble}, Ptr{ego}), context, stype, rvec, body_ptr)
    return (body_ptr[], status)
end

"""
    getBodyFromModel( topo::ego )

Returns a body (`ego` object) from a model (also an `ego` object). This is
necessary to perform Boolean operations.
"""
function getBodyFromModel( topo::ego )
    geom     = Ref{ego}()
    oclass   = Ref{Int32}(0)
    _type    = Ref{Int32}(0)
    limits   = fill(0.0, 4)
    nchild   = Ref{Int32}(0)
    sense    = Ref{Ptr{Int32}}(0)
    children = Ref{Ptr{ego}}()

    status  = ccall((:EG_getTopology, libegads_include), Cint, (ego, Ptr{ego},
                     Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint},
                     Ptr{Ptr{ego}}, Ptr{Ptr{Cint}}), topo, geom, oclass, _type,
                     limits, nchild, children, sense)

    carray = children[]
    child0 = unsafe_load(carray,1)

    if nchild[] != 1
        println("nchild ", nchild[])
        warn("You are trying to get one body from a multi-body model.")
    end

    return (child0, status)
end

function cleanup( status::Cint, context::ego )
    warn("No success, status: ", status )
    status = EG_close(context)
    @printf("EG_close -> status=%d\n", status);
end

function cleanup( context::ego )
    status = EG_close(context)
    @printf("EG_close -> status=%d\n", status);
end
