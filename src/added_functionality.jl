
function eg_open( )
    ptr_obj = Ref{ego}()
    status = ccall((:EG_open, libegads_include), Cint, (Ptr{ego},), ptr_obj)
    return (ptr_obj[], status)
end

function solidBoolean(src::ego, tool::ego, oper::Cint )
    model_ptr = Ref{ego}()
    status = ccall((:EG_solidBoolean, libegads_include), Cint, (ego, ego, Cint, Ptr{ego}), src, tool, oper, model_ptr)
    return (model_ptr[], status)
end

function makeSolidBody(context::ego, stype::Cint, rvec)
    body_ptr = Ref{ego}()
    status = ccall((:EG_makeSolidBody, libegads_include), Cint, (ego, Cint, Ptr{Cdouble}, Ptr{ego}), context, stype, rvec, body_ptr)
    return (body_ptr[], status)
end
