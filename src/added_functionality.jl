# ---------------------------------------------------------------------------- #
#
#   added_functionality.jl
#
#   Additional functions that make using egads from julia more straightforward.
#
#   egads.jl
#   Spring 2018
#
#   Max Opgenoord
#
# ---------------------------------------------------------------------------- #

"""
    EG_open( )

Opens an `egads` context.
"""
function EG_open( )
    ptr_obj = Ref{ego}()
    status = ccall((:EG_open, libegads_include), Cint, (Ptr{ego},), ptr_obj)
    return (ptr_obj[], status)
end

"""
    EG_getContext(object::ego)

Returns the `egads` context.
"""

function EG_getContext(object::ego)
    context_ptr = Ref{ego}()
    status = ccall((:EG_getContext, libegads_include), Cint, (ego, Ptr{ego}), object, context_ptr)
    return (context_ptr[], status)
end

"""
    EG_solidBoolean(src::ego, tool::ego, oper::Cint )

Performs a Boolean operation on the `ego` objects `src` and `tool`. `oper`
specifies the type of Boolean operation, such as `FUSION`, `INTERSECTION`, etc.
"""
function EG_solidBoolean(src::ego, tool::ego, oper::Cint )
    model_ptr = Ref{ego}()
    status = ccall((:EG_solidBoolean, libegads_include), Cint, (ego, ego,
                Cint, Ptr{ego}), src, tool, oper, model_ptr)
    return (model_ptr[], status)
end

"""
    EG_makeSolidBody(context::ego, stype::Cint, rvec)

Makes a solid object. `context` is the current egads context, `stype` specifies
the type of object, e.g. CYLINDER, SPHERE, etc. `rvec` is an array which holds
the data defining the object.
"""
function EG_makeSolidBody(context::ego, stype::Cint, rvec)
    body_ptr = Ref{ego}()
    status = ccall((:EG_makeSolidBody, libegads_include), Cint, (ego, Cint,
                Ptr{Cdouble}, Ptr{ego}), context, stype, rvec, body_ptr)
    return (body_ptr[], status)
end

"""
    EG_filletBody(src::ego, nedge::Cint, edges, radius::Cdouble, facemap)

Takes in a body `src` and puts a fillet of radius `radius` around the edges
defined in `edges`.
"""
function EG_filletBody(src::ego, nedge::Cint, edges, radius::Cdouble, facemap)
    result_ptr = Ref{ego}()
    status = ccall((:EG_filletBody, libegads_include), Cint, (ego, Cint, Ptr{ego}, Cdouble, Ptr{ego}, Ptr{Ptr{Cint}}), src, nedge, edges, radius, result_ptr, facemap)
    return (result_ptr[],status)
end

"""
    EG_makeTopology(context::ego, geom::ego, oclass::Cint, mtype::Cint, limits, nChildren::Cint, children, senses)

Makes a topology.
"""
function EG_makeTopology(context::ego, geom::ego, oclass::Cint, mtype::Cint, limits, nChildren::Cint, children, senses)
    topo_ptr = Ref{ego}()
    status = ccall((:EG_makeTopology, libegads_include), Cint, (ego, ego, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{ego}, Ptr{Cint},
                Ptr{ego}), context, geom, oclass, mtype, limits, nChildren, children, senses, topo_ptr)
    return (topo_ptr[], status)
end

"""
    EG_makeGeometry(context::ego, oclass::Cint, mtype::Cint, refGeom::ego, ivec, rvec)

Returns a geometry.
"""
function EG_makeGeometry(context::ego, oclass::Cint, mtype::Cint, refGeom::ego, ivec, rvec)
    geom_ptr = Ref{ego}()
    status = ccall((:EG_makeGeometry, libegads_include), Cint, (ego, Cint, Cint, ego, Ptr{Cint}, Ptr{Cdouble}, Ptr{ego}), context, oclass, mtype, refGeom, ivec, rvec, geom_ptr)
    return (geom_ptr[],status)
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

"""
    EG_invEvaluate(geom::ego, xyz, results)

Returns parameters from inverse evaluation.
"""
function EG_invEvaluate(geom::ego, xyz, results)
    param_ptr = Ref{Cdouble}(0.0)
    status = ccall((:EG_invEvaluate, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), geom, xyz, param_ptr, results)
    return (param_ptr[], status)
end

"""
    EG_copyObject(object::ego, oform)

Copies the `ego` object `object`.
"""
function EG_copyObject(object::ego, oform)
    copy_ptr = Ref{ego}()
    status = ccall((:EG_copyObject, libegads_include), Cint, (ego, Ptr{Void}, Ptr{ego}), object, oform, copy_ptr)
    return (copy_ptr[],status)
end

"""
    EG_makeFace(object::ego, mtype::Cint, limits)

Makes a face and returns it.
"""
function EG_makeFace(object::ego, mtype::Cint, limits)
    face_ptr = Ref{ego}()
    status = ccall((:EG_makeFace, libegads_include), Cint, (ego, Cint, Ptr{Cdouble}, Ptr{ego}), object, mtype, limits, face_ptr)
    return (face_ptr[],status)
end

"""
    EG_otherCurve(surface::ego, curve::ego, tol::Cdouble)

"""
function EG_otherCurve(surface::ego, curve::ego, tol::Cdouble)
    newcurve_ptr = Ref{ego}()
    status = ccall((:EG_otherCurve, libegads_include), Cint, (ego, ego, Cdouble, Ptr{ego}), surface, curve, tol, newcurve_ptr)
    return (newcurve_ptr[],status)
end

"""
    EG_sewFaces(nobj::Cint, objs, toler::Cdouble, flag::Cint)

Sews the faces in `objs` together and returns a new model.
"""
function EG_sewFaces(nobj::Cint, objs, toler::Cdouble, flag::Cint)
    result_ptr = Ref{ego}()
    status = ccall((:EG_sewFaces, libegads_include), Cint, (Cint, Ptr{ego}, Cdouble, Cint, Ptr{ego}), nobj, objs, toler, flag, result_ptr)
    return (result_ptr[], status)
end

"""
    EG_join( ebody1::ego, ebody2::ego, toler::Cdouble)

Joins two bodies with common faces.
"""
function EG_join( ebody1::ego, ebody2::ego, toler::Cdouble)
    # find faces - 1
    nface1_ptr = Ref{Cint}(0)
    faces1_ptr = Ref{Ptr{ego}}()
    egads.EG_getBodyTopos(ebody1, NULL_E, FACE, nface1_ptr, faces1_ptr)
    nface1 = nface1_ptr[]

    # find faces - 2
    nface2_ptr = Ref{Cint}(0)
    faces2_ptr = Ref{Ptr{ego}}()
    egads.EG_getBodyTopos(ebody2, NULL_E, FACE, nface2_ptr, faces2_ptr)
    nface2 = nface2_ptr[]

    # match faces
    nmatch_ptr = Ref{Cint}(0)
    match_ptr  = Ref{Ptr{Cint}}()
    EG_matchBodyFaces(ebody1, ebody2, toler, nmatch_ptr, match_ptr)
    nmatch = nmatch_ptr[]
    matches = fill( 0, 2*nmatch )
    for ii in 1:nmatch
        matches[2*ii-1] = unsafe_load(match_ptr[],2*ii-1)
        matches[2*ii]   = unsafe_load(match_ptr[],2*ii)
    end

    # delete all matching faces
    efaces = Vector{ ego }( nface1 + nface2 )
    jj = 1
    for ii in 1:nface1
        efaces[jj] = unsafe_load(faces1_ptr[],ii); jj += 1
        for kk in 1:nmatch
            if (ii == matches[2*kk-1])
                jj -= 1
            end
        end
    end
    for ii in 1:nface2
        efaces[jj] = unsafe_load(faces2_ptr[],ii); jj += 1
        for kk in 1:nmatch
            if (ii == matches[2*kk])
                jj -= 1
            end
        end
    end
    jj -= 1

    # sew faces
    (emodel, status) = EG_sewFaces( Cint(jj), efaces, toler, Cint(0) )

    return (emodel, status)

end

"""
    EG_getBodyFaces( ebody::ego, toler::Cdouble)

Get faces from body.
"""
function EG_getBodyFaces( ebody::ego, toler::Cdouble)

    nface_ptr = Ref{Cint}(0)
    faces_ptr = Ref{Ptr{ego}}()
    status = egads.EG_getBodyTopos(ebody, NULL_E, FACE, nface_ptr, faces_ptr)
    nface  = nface_ptr[]

    return (nface, faces_ptr, status)

end

"""
    EG_matchBodyFaces( ebody1::ego, ebody2::ego, toler::Cdouble)

Matches the faces on both bodies.
"""
function EG_matchBodyFaces( ebody1::ego, ebody2::ego, toler::Cdouble)

    # match faces
    nmatch_ptr = Ref{Cint}(0)
    match_ptr  = Ref{Ptr{Cint}}()
    status = EG_matchBodyFaces(ebody1, ebody2, toler, nmatch_ptr, match_ptr)
    nmatch = nmatch_ptr[]
    matches = fill( 0, 2*nmatch )
    for ii in 1:nmatch
        matches[2*ii-1] = unsafe_load(match_ptr[],2*ii-1)
        matches[2*ii]   = unsafe_load(match_ptr[],2*ii)
    end

    return (nmatch, matches, status)

end

"""
    cleanup( status::Cint, context::ego )

Cleans up the context if something went wrong.
"""
function cleanup( status::Cint, context::ego )
    warn("No success, status: ", status )
    status = EG_close(context)
    @printf("EG_close -> status=%d\n", status);
end

"""
    cleanup( context::ego )

Cleans up the context at end of a file.
"""
function cleanup( context::ego )
    status = EG_close(context)
    @printf("EG_close -> status=%d\n", status);
end
