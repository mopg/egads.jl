
function eg_open( )
    ptr_obj = Ref{ego}()
    status = ccall((:EG_open, libegads_include), Cint, (Ptr{ego},), ptr_obj)
    return (ptr_obj[], status)
end

function solidBoolean(src::ego, tool::ego, oper::Cint )
    model_ptr = Ref{ego}()
    status = ccall((:EG_solidBoolean, libegads_include), Cint, (ego, ego,
                Cint, Ptr{ego}), src, tool, oper, model_ptr)
    return (model_ptr[], status)
end

function makeSolidBody(context::ego, stype::Cint, rvec)
    body_ptr = Ref{ego}()
    status = ccall((:EG_makeSolidBody, libegads_include), Cint, (ego, Cint,
                Ptr{Cdouble}, Ptr{ego}), context, stype, rvec, body_ptr)
    return (body_ptr[], status)
end

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
