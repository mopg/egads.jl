# ---------------------------------------------------------------------------- #
#
#   include_egads.jl
#
#   Julia function calls for egads functionality. This file is automatically
#     generated using the Clang.jl C-wrapper.
#
#   egads.jl
#   Spring 2018
#
#   Max Opgenoord
#
# ---------------------------------------------------------------------------- #

# Julia wrapper for header: EngSketchPad/include/egads.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function EG_alloc(nbytes::Cint)
    ccall((:EG_alloc, libegads_include), Ptr{Void}, (Cint,), nbytes)
end

function EG_calloc(nele::Cint, size::Cint)
    ccall((:EG_calloc, libegads_include), Ptr{Void}, (Cint, Cint), nele, size)
end

function EG_reall(ptr, nbytes::Cint)
    ccall((:EG_reall, libegads_include), Ptr{Void}, (Ptr{Void}, Cint), ptr, nbytes)
end

function EG_free(pointer)
    ccall((:EG_free, libegads_include), Void, (Ptr{Void},), pointer)
end

function EG_revision(major, minor, OCCrev)
    ccall((:EG_revision, libegads_include), Void, (Ptr{Cint}, Ptr{Cint}, Ptr{Cstring}), major, minor, OCCrev)
end

function EG_open(context)
    ccall((:EG_open, libegads_include), Cint, (Ptr{ego},), context)
end

function EG_loadModel(context::ego, bflg::Cint, name, model)
    ccall((:EG_loadModel, libegads_include), Cint, (ego, Cint, Cstring, Ptr{ego}), context, bflg, name, model)
end

function EG_saveModel(model::ego, name)
    ccall((:EG_saveModel, libegads_include), Cint, (ego, Cstring), model, name)
end

function EG_deleteObject(object::ego)
    ccall((:EG_deleteObject, libegads_include), Cint, (ego,), object)
end

function EG_makeTransform(context::ego, xform, oform)
    ccall((:EG_makeTransform, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{ego}), context, xform, oform)
end

function EG_getTransformation(oform::ego, xform)
    ccall((:EG_getTransformation, libegads_include), Cint, (ego, Ptr{Cdouble}), oform, xform)
end

function EG_getContext(object::ego, context)
    ccall((:EG_getContext, libegads_include), Cint, (ego, Ptr{ego}), object, context)
end

function EG_setOutLevel(context::ego, outLevel::Cint)
    ccall((:EG_setOutLevel, libegads_include), Cint, (ego, Cint), context, outLevel)
end

function EG_getInfo(object::ego, oclass, mtype, topObj, prev, next)
    ccall((:EG_getInfo, libegads_include), Cint, (ego, Ptr{Cint}, Ptr{Cint}, Ptr{ego}, Ptr{ego}, Ptr{ego}), object, oclass, mtype, topObj, prev, next)
end

function EG_copyObject(object::ego, oform, copy)
    ccall((:EG_copyObject, libegads_include), Cint, (ego, Ptr{Void}, Ptr{ego}), object, oform, copy)
end

function EG_flipObject(object::ego, flippedCopy)
    ccall((:EG_flipObject, libegads_include), Cint, (ego, Ptr{ego}), object, flippedCopy)
end

function EG_close(context::ego)
    ccall((:EG_close, libegads_include), Cint, (ego,), context)
end

function EG_setUserPointer(context::ego, ptr)
    ccall((:EG_setUserPointer, libegads_include), Cint, (ego, Ptr{Void}), context, ptr)
end

function EG_getUserPointer(context::ego, ptr)
    ccall((:EG_getUserPointer, libegads_include), Cint, (ego, Ptr{Ptr{Void}}), context, ptr)
end

function EG_attributeAdd(obj::ego, name, _type::Cint, len::Cint, ints, reals, str)
    ccall((:EG_attributeAdd, libegads_include), Cint, (ego, Cstring, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Cstring), obj, name, _type, len, ints, reals, str)
end

function EG_attributeDel(object::ego, name)
    ccall((:EG_attributeDel, libegads_include), Cint, (ego, Cstring), object, name)
end

function EG_attributeNum(obj::ego, num)
    ccall((:EG_attributeNum, libegads_include), Cint, (ego, Ptr{Cint}), obj, num)
end

function EG_attributeGet(obj::ego, index::Cint, name, atype, len, ints, reals, str)
    ccall((:EG_attributeGet, libegads_include), Cint, (ego, Cint, Ptr{Cstring}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cdouble}}, Ptr{Cstring}), obj, index, name, atype, len, ints, reals, str)
end

function EG_attributeRet(obj::ego, name, atype, len, ints, reals, str)
    ccall((:EG_attributeRet, libegads_include), Cint, (ego, Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cdouble}}, Ptr{Cstring}), obj, name, atype, len, ints, reals, str)
end

function EG_attributeDup(src::ego, dst::ego)
    ccall((:EG_attributeDup, libegads_include), Cint, (ego, ego), src, dst)
end

function EG_getGeometry(geom::ego, oclass, mtype, refGeom, ivec, rvec)
    ccall((:EG_getGeometry, libegads_include), Cint, (ego, Ptr{Cint}, Ptr{Cint}, Ptr{ego}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cdouble}}), geom, oclass, mtype, refGeom, ivec, rvec)
end

function EG_makeGeometry(context::ego, oclass::Cint, mtype::Cint, refGeom::ego, ivec, rvec, geom)
    ccall((:EG_makeGeometry, libegads_include), Cint, (ego, Cint, Cint, ego, Ptr{Cint}, Ptr{Cdouble}, Ptr{ego}), context, oclass, mtype, refGeom, ivec, rvec, geom)
end

function EG_getRange(geom::ego, range, periodic)
    ccall((:EG_getRange, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cint}), geom, range, periodic)
end

function EG_evaluate(geom::ego, param, results)
    ccall((:EG_evaluate, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cdouble}), geom, param, results)
end

function EG_invEvaluate(geom::ego, xyz, param, results)
    ccall((:EG_invEvaluate, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), geom, xyz, param, results)
end

function EG_invEvaluateGuess(geom::ego, xyz, param, results)
    ccall((:EG_invEvaluateGuess, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), geom, xyz, param, results)
end

function EG_arcLength(geom::ego, t1::Cdouble, t2::Cdouble, alen)
    ccall((:EG_arcLength, libegads_include), Cint, (ego, Cdouble, Cdouble, Ptr{Cdouble}), geom, t1, t2, alen)
end

function EG_curvature(geom::ego, param, results)
    ccall((:EG_curvature, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cdouble}), geom, param, results)
end

function EG_approximate(context::ego, maxdeg::Cint, tol::Cdouble, sizes, xyzs, bspline)
    ccall((:EG_approximate, libegads_include), Cint, (ego, Cint, Cdouble, Ptr{Cint}, Ptr{Cdouble}, Ptr{ego}), context, maxdeg, tol, sizes, xyzs, bspline)
end

function EG_fitTriangles(context::ego, npts::Cint, xyzs, ntris::Cint, tris, tric, tol::Cdouble, bspline)
    ccall((:EG_fitTriangles, libegads_include), Cint, (ego, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint}, Cdouble, Ptr{ego}), context, npts, xyzs, ntris, tris, tric, tol, bspline)
end

function EG_otherCurve(surface::ego, curve::ego, tol::Cdouble, newcurve)
    ccall((:EG_otherCurve, libegads_include), Cint, (ego, ego, Cdouble, Ptr{ego}), surface, curve, tol, newcurve)
end

function EG_isSame(geom1::ego, geom2::ego)
    ccall((:EG_isSame, libegads_include), Cint, (ego, ego), geom1, geom2)
end

function EG_isoCline(surface::ego, UV::Cint, val::Cdouble, newcurve)
    ccall((:EG_isoCline, libegads_include), Cint, (ego, Cint, Cdouble, Ptr{ego}), surface, UV, val, newcurve)
end

function EG_convertToBSpline(geom::ego, bspline)
    ccall((:EG_convertToBSpline, libegads_include), Cint, (ego, Ptr{ego}), geom, bspline)
end

function EG_convertToBSplineRange(geom::ego, range, bspline)
    ccall((:EG_convertToBSplineRange, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{ego}), geom, range, bspline)
end

function EG_skinning(context::ego, nCurves::Cint, curves, skinning_degree::Cint, surface)
    ccall((:EG_skinning, libegads_include), Cint, (ego, Cint, Ptr{ego}, Cint, Ptr{ego}), context, nCurves, curves, skinning_degree, surface)
end

function EG_tolerance(topo::ego, tol)
    ccall((:EG_tolerance, libegads_include), Cint, (ego, Ptr{Cdouble}), topo, tol)
end

function EG_getTolerance(topo::ego, tol)
    ccall((:EG_getTolerance, libegads_include), Cint, (ego, Ptr{Cdouble}), topo, tol)
end

function EG_setTolerance(topo::ego, tol::Cdouble)
    ccall((:EG_setTolerance, libegads_include), Cint, (ego, Cdouble), topo, tol)
end

function EG_getTopology(topo::ego, geom, oclass, _type, limits, nChildren, children, sense)
    ccall((:EG_getTopology, libegads_include), Cint, (ego, Ptr{ego}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{ego}}, Ptr{Ptr{Cint}}), topo, geom, oclass, _type, limits, nChildren, children, sense)
end

function EG_makeTopology(context::ego, geom::ego, oclass::Cint, mtype::Cint, limits, nChildren::Cint, children, senses, topo)
    ccall((:EG_makeTopology, libegads_include), Cint, (ego, ego, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{ego}, Ptr{Cint}, Ptr{ego}), context, geom, oclass, mtype, limits, nChildren, children, senses, topo)
end

function EG_makeLoop(nedge::Cint, edges, geom::ego, toler::Cdouble, result)
    ccall((:EG_makeLoop, libegads_include), Cint, (Cint, Ptr{ego}, ego, Cdouble, Ptr{ego}), nedge, edges, geom, toler, result)
end

function EG_getArea(object::ego, limits, area)
    ccall((:EG_getArea, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cdouble}), object, limits, area)
end

function EG_makeFace(object::ego, mtype::Cint, limits, face)
    ccall((:EG_makeFace, libegads_include), Cint, (ego, Cint, Ptr{Cdouble}, Ptr{ego}), object, mtype, limits, face)
end

function EG_getBodyTopos(body::ego, src::ego, oclass::Cint, ntopo, topos)
    ccall((:EG_getBodyTopos, libegads_include), Cint, (ego, ego, Cint, Ptr{Cint}, Ptr{Ptr{ego}}), body, src, oclass, ntopo, topos)
end

function EG_indexBodyTopo(body::ego, src::ego)
    ccall((:EG_indexBodyTopo, libegads_include), Cint, (ego, ego), body, src)
end

function EG_objectBodyTopo(body::ego, oclass::Cint, index::Cint, obj)
    ccall((:EG_objectBodyTopo, libegads_include), Cint, (ego, Cint, Cint, Ptr{ego}), body, oclass, index, obj)
end

function EG_inTopology(topo::ego, xyz)
    ccall((:EG_inTopology, libegads_include), Cint, (ego, Ptr{Cdouble}), topo, xyz)
end

function EG_inFace(face::ego, uv)
    ccall((:EG_inFace, libegads_include), Cint, (ego, Ptr{Cdouble}), face, uv)
end

function EG_getEdgeUV(face::ego, edge::ego, sense::Cint, t::Cdouble, UV)
    ccall((:EG_getEdgeUV, libegads_include), Cint, (ego, ego, Cint, Cdouble, Ptr{Cdouble}), face, edge, sense, t, UV)
end

function EG_getPCurve(face::ego, edge::ego, sense::Cint, mtype, ivec, rvec)
    ccall((:EG_getPCurve, libegads_include), Cint, (ego, ego, Cint, Ptr{Cint}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cdouble}}), face, edge, sense, mtype, ivec, rvec)
end

function EG_getBody(object::ego, body)
    ccall((:EG_getBody, libegads_include), Cint, (ego, Ptr{ego}), object, body)
end

function EG_makeSolidBody(context::ego, stype::Cint, rvec, body)
    ccall((:EG_makeSolidBody, libegads_include), Cint, (ego, Cint, Ptr{Cdouble}, Ptr{ego}), context, stype, rvec, body)
end

function EG_getBoundingBox(topo::ego, bbox)
    ccall((:EG_getBoundingBox, libegads_include), Cint, (ego, Ptr{Cdouble}), topo, bbox)
end

function EG_getMassProperties(topo::ego, result)
    ccall((:EG_getMassProperties, libegads_include), Cint, (ego, Ptr{Cdouble}), topo, result)
end

function EG_isEquivalent(topo1::ego, topo2::ego)
    ccall((:EG_isEquivalent, libegads_include), Cint, (ego, ego), topo1, topo2)
end

function EG_sewFaces(nobj::Cint, objs, toler::Cdouble, flag::Cint, result)
    ccall((:EG_sewFaces, libegads_include), Cint, (Cint, Ptr{ego}, Cdouble, Cint, Ptr{ego}), nobj, objs, toler, flag, result)
end

function EG_replaceFaces(body::ego, nobj::Cint, objs, result)
    ccall((:EG_replaceFaces, libegads_include), Cint, (ego, Cint, Ptr{ego}, Ptr{ego}), body, nobj, objs, result)
end

function EG_mapBody(sBody::ego, dBody::ego, fAttr, mapBody)
    ccall((:EG_mapBody, libegads_include), Cint, (ego, ego, Cstring, Ptr{ego}), sBody, dBody, fAttr, mapBody)
end

function EG_matchBodyFaces(body1::ego, body2::ego, toler::Cdouble, nmatch, match)
    ccall((:EG_matchBodyFaces, libegads_include), Cint, (ego, ego, Cdouble, Ptr{Cint}, Ptr{Ptr{Cint}}), body1, body2, toler, nmatch, match)
end

function EG_setTessParam(context::ego, iparam::Cint, value::Cdouble, oldvalue)
    ccall((:EG_setTessParam, libegads_include), Cint, (ego, Cint, Cdouble, Ptr{Cdouble}), context, iparam, value, oldvalue)
end

function EG_makeTessGeom(obj::ego, params, sizes, tess)
    ccall((:EG_makeTessGeom, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{Cint}, Ptr{ego}), obj, params, sizes, tess)
end

function EG_getTessGeom(tess::ego, sizes, xyz)
    ccall((:EG_getTessGeom, libegads_include), Cint, (ego, Ptr{Cint}, Ptr{Ptr{Cdouble}}), tess, sizes, xyz)
end

function EG_makeTessBody(object::ego, params, tess)
    ccall((:EG_makeTessBody, libegads_include), Cint, (ego, Ptr{Cdouble}, Ptr{ego}), object, params, tess)
end

function EG_remakeTess(tess::ego, nobj::Cint, objs, params)
    ccall((:EG_remakeTess, libegads_include), Cint, (ego, Cint, Ptr{ego}, Ptr{Cdouble}), tess, nobj, objs, params)
end

function EG_mapTessBody(tess::ego, body::ego, mapTess)
    ccall((:EG_mapTessBody, libegads_include), Cint, (ego, ego, Ptr{ego}), tess, body, mapTess)
end

function EG_locateTessBody(tess::ego, npt::Cint, ifaces, uv, itri, results)
    ccall((:EG_locateTessBody, libegads_include), Cint, (ego, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}), tess, npt, ifaces, uv, itri, results)
end

function EG_getTessEdge(tess::ego, eIndex::Cint, len, xyz, t)
    ccall((:EG_getTessEdge, libegads_include), Cint, (ego, Cint, Ptr{Cint}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}), tess, eIndex, len, xyz, t)
end

function EG_getTessFace(tess::ego, fIndex::Cint, len, xyz, uv, ptype, pindex, ntri, tris, tric)
    ccall((:EG_getTessFace, libegads_include), Cint, (ego, Cint, Ptr{Cint}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cint}}, Ptr{Cint}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cint}}), tess, fIndex, len, xyz, uv, ptype, pindex, ntri, tris, tric)
end

function EG_getTessLoops(tess::ego, fIndex::Cint, nloop, lIndices)
    ccall((:EG_getTessLoops, libegads_include), Cint, (ego, Cint, Ptr{Cint}, Ptr{Ptr{Cint}}), tess, fIndex, nloop, lIndices)
end

function EG_getTessQuads(tess::ego, nquad, fIndices)
    ccall((:EG_getTessQuads, libegads_include), Cint, (ego, Ptr{Cint}, Ptr{Ptr{Cint}}), tess, nquad, fIndices)
end

function EG_makeQuads(tess::ego, params, fIndex::Cint)
    ccall((:EG_makeQuads, libegads_include), Cint, (ego, Ptr{Cdouble}, Cint), tess, params, fIndex)
end

function EG_getQuads(tess::ego, fIndex::Cint, len, xyz, uv, ptype, pindex, npatch)
    ccall((:EG_getQuads, libegads_include), Cint, (ego, Cint, Ptr{Cint}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cint}}, Ptr{Cint}), tess, fIndex, len, xyz, uv, ptype, pindex, npatch)
end

function EG_getPatch(tess::ego, fIndex::Cint, patch::Cint, nu, nv, ipts, bounds)
    ccall((:EG_getPatch, libegads_include), Cint, (ego, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cint}}), tess, fIndex, patch, nu, nv, ipts, bounds)
end

function EG_quadTess(tess::ego, quadTess)
    ccall((:EG_quadTess, libegads_include), Cint, (ego, Ptr{ego}), tess, quadTess)
end

function EG_insertEdgeVerts(tess::ego, eIndex::Cint, vIndex::Cint, npts::Cint, t)
    ccall((:EG_insertEdgeVerts, libegads_include), Cint, (ego, Cint, Cint, Cint, Ptr{Cdouble}), tess, eIndex, vIndex, npts, t)
end

function EG_deleteEdgeVert(tess::ego, eIndex::Cint, vIndex::Cint, dir::Cint)
    ccall((:EG_deleteEdgeVert, libegads_include), Cint, (ego, Cint, Cint, Cint), tess, eIndex, vIndex, dir)
end

function EG_moveEdgeVert(tess::ego, eIndex::Cint, vIndex::Cint, t::Cdouble)
    ccall((:EG_moveEdgeVert, libegads_include), Cint, (ego, Cint, Cint, Cdouble), tess, eIndex, vIndex, t)
end

function EG_openTessBody(tess::ego)
    ccall((:EG_openTessBody, libegads_include), Cint, (ego,), tess)
end

function EG_initTessBody(object::ego, tess)
    ccall((:EG_initTessBody, libegads_include), Cint, (ego, Ptr{ego}), object, tess)
end

function EG_statusTessBody(tess::ego, body, state, np)
    ccall((:EG_statusTessBody, libegads_include), Cint, (ego, Ptr{ego}, Ptr{Cint}, Ptr{Cint}), tess, body, state, np)
end

function EG_setTessEdge(tess::ego, eIndex::Cint, len::Cint, xyz, t)
    ccall((:EG_setTessEdge, libegads_include), Cint, (ego, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}), tess, eIndex, len, xyz, t)
end

function EG_setTessFace(tess::ego, fIndex::Cint, len::Cint, xyz, uv, ntri::Cint, tris)
    ccall((:EG_setTessFace, libegads_include), Cint, (ego, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Ptr{Cint}), tess, fIndex, len, xyz, uv, ntri, tris)
end

function EG_localToGlobal(tess::ego, index::Cint, _local::Cint, _global)
    ccall((:EG_localToGlobal, libegads_include), Cint, (ego, Cint, Cint, Ptr{Cint}), tess, index, _local, _global)
end

function EG_getGlobal(tess::ego, _global::Cint, ptype, pindex, xyz)
    ccall((:EG_getGlobal, libegads_include), Cint, (ego, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), tess, _global, ptype, pindex, xyz)
end

function EG_solidBoolean(src::ego, tool::ego, oper::Cint, model)
    ccall((:EG_solidBoolean, libegads_include), Cint, (ego, ego, Cint, Ptr{ego}), src, tool, oper, model)
end

function EG_intersection(src::ego, tool::ego, nedge, facEdg, model)
    ccall((:EG_intersection, libegads_include), Cint, (ego, ego, Ptr{Cint}, Ptr{Ptr{ego}}, Ptr{ego}), src, tool, nedge, facEdg, model)
end

function EG_imprintBody(src::ego, nedge::Cint, facEdg, result)
    ccall((:EG_imprintBody, libegads_include), Cint, (ego, Cint, Ptr{ego}, Ptr{ego}), src, nedge, facEdg, result)
end

function EG_filletBody(src::ego, nedge::Cint, edges, radius::Cdouble, result, facemap)
    ccall((:EG_filletBody, libegads_include), Cint, (ego, Cint, Ptr{ego}, Cdouble, Ptr{ego}, Ptr{Ptr{Cint}}), src, nedge, edges, radius, result, facemap)
end

function EG_chamferBody(src::ego, nedge::Cint, edges, faces, dis1::Cdouble, dis2::Cdouble, result, facemap)
    ccall((:EG_chamferBody, libegads_include), Cint, (ego, Cint, Ptr{ego}, Ptr{ego}, Cdouble, Cdouble, Ptr{ego}, Ptr{Ptr{Cint}}), src, nedge, edges, faces, dis1, dis2, result, facemap)
end

function EG_hollowBody(src::ego, nface::Cint, faces, offset::Cdouble, join::Cint, result, facemap)
    ccall((:EG_hollowBody, libegads_include), Cint, (ego, Cint, Ptr{ego}, Cdouble, Cint, Ptr{ego}, Ptr{Ptr{Cint}}), src, nface, faces, offset, join, result, facemap)
end

function EG_extrude(src::ego, dist::Cdouble, dir, result)
    ccall((:EG_extrude, libegads_include), Cint, (ego, Cdouble, Ptr{Cdouble}, Ptr{ego}), src, dist, dir, result)
end

function EG_rotate(src::ego, angle::Cdouble, axis, result)
    ccall((:EG_rotate, libegads_include), Cint, (ego, Cdouble, Ptr{Cdouble}, Ptr{ego}), src, angle, axis, result)
end

function EG_sweep(src::ego, spine::ego, mode::Cint, result)
    ccall((:EG_sweep, libegads_include), Cint, (ego, ego, Cint, Ptr{ego}), src, spine, mode, result)
end

function EG_loft(nsec::Cint, secs, opt::Cint, result)
    ccall((:EG_loft, libegads_include), Cint, (Cint, Ptr{ego}, Cint, Ptr{ego}), nsec, secs, opt, result)
end

function EG_blend(nsec::Cint, secs, rc1, rcN, result)
    ccall((:EG_blend, libegads_include), Cint, (Cint, Ptr{ego}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{ego}), nsec, secs, rc1, rcN, result)
end

function EG_ruled(nsec::Cint, secs, result)
    ccall((:EG_ruled, libegads_include), Cint, (Cint, Ptr{ego}, Ptr{ego}), nsec, secs, result)
end
# Julia wrapper for header: EngSketchPad/include/egadsErrors.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: EngSketchPad/include/egadsTypes.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: EngSketchPad/include/common.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: EngSketchPad/include/egadsBlendSens.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function EG_blend_init(nSection::Cint, sections, rc1, rc1_dot, rcN, rcN_dot, nStrips, cache)
    ccall((:EG_blend_init, libegads_include), Cint, (Cint, Ptr{ego}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Void}}), nSection, sections, rc1, rc1_dot, rcN, rcN_dot, nStrips, cache)
end

function EG_blend_pos(cache, sIndex::Cint, objs, imax, ts)
    ccall((:EG_blend_pos, libegads_include), Cint, (Ptr{Void}, Cint, Ptr{Ptr{ego}}, Ptr{Cint}, Ptr{Ptr{Cdouble}}), cache, sIndex, objs, imax, ts)
end

function EG_blend_sens(cache, sIndex::Cint, xyzs, xyzs_dot, tbeg, tbeg_dot, tend, tend_dot)
    ccall((:EG_blend_sens, libegads_include), Cint, (Ptr{Void}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), cache, sIndex, xyzs, xyzs_dot, tbeg, tbeg_dot, tend, tend_dot)
end

function EG_blend_seval(cache, sIndex::Cint, uv, xyz, vel)
    ccall((:EG_blend_seval, libegads_include), Cint, (Ptr{Void}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), cache, sIndex, uv, xyz, vel)
end

function EG_sens_free(cache)
    ccall((:EG_sens_free, libegads_include), Void, (Ptr{Void},), cache)
end
# Julia wrapper for header: EngSketchPad/include/egadsSplineFit.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function EG_spline1dEval(ivec, data, t::Cdouble, point)
    ccall((:EG_spline1dEval, libegads_include), Cint, (Ptr{Cint}, Ptr{Cdouble}, Cdouble, Ptr{Cdouble}), ivec, data, t, point)
end

function EG_spline1dEval_psens(ivec, data, rdata_xyz, xyz_dot, t::Cdouble, point, point_dot)
    ccall((:EG_spline1dEval_psens, libegads_include), Cint, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}), ivec, data, rdata_xyz, xyz_dot, t, point, point_dot)
end

function EG_spline1dDeriv(ivec, data, der::Cint, t::Cdouble, deriv)
    ccall((:EG_spline1dDeriv, libegads_include), Cint, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cdouble, Ptr{Cdouble}), ivec, data, der, t, deriv)
end

function EG_spline1dFit(endx::Cint, imaxx::Cint, xyz, kn, tol::Cdouble, header, rdata)
    ccall((:EG_spline1dFit, libegads_include), Cint, (Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{Cint}, Ptr{Ptr{Cdouble}}), endx, imaxx, xyz, kn, tol, header, rdata)
end

function EG_spline1dFit_psens(endx::Cint, imaxx::Cint, xyz, kn, tol::Cdouble, header, rdata, rdata_xyz)
    ccall((:EG_spline1dFit_psens, libegads_include), Cint, (Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{Cint}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}), endx, imaxx, xyz, kn, tol, header, rdata, rdata_xyz)
end

function EG_spline2dEval(ivec, data, uv, point)
    ccall((:EG_spline2dEval, libegads_include), Cint, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), ivec, data, uv, point)
end

function EG_spline2dEval_psens(ivec, data, data_dot, xyz_dot, uv, point, point_dot)
    ccall((:EG_spline2dEval_psens, libegads_include), Cint, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), ivec, data, data_dot, xyz_dot, uv, point, point_dot)
end

function EG_spline2dDeriv(ivec, data, der::Cint, uv, deriv)
    ccall((:EG_spline2dDeriv, libegads_include), Cint, (Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cdouble}), ivec, data, der, uv, deriv)
end

function EG_spline2dAprx(e::Cint, im::Cint, jm::Cint, xyz, uknot, vknot, vdata, wesT, easT, south, snor, north, nnor, tol::Cdouble, header, rdata)
    ccall((:EG_spline2dAprx, libegads_include), Cint, (Cint, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{Cint}, Ptr{Ptr{Cdouble}}), e, im, jm, xyz, uknot, vknot, vdata, wesT, easT, south, snor, north, nnor, tol, header, rdata)
end
# Julia wrapper for header: EngSketchPad/include/egadsTris.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: EngSketchPad/include/egg.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function eggGenerate(uv, nbnd, gridP)
    ccall((:eggGenerate, libegads_include), Cint, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Void}}), uv, nbnd, gridP)
end

function eggMorph(gridP, uvnew, newGridP)
    ccall((:eggMorph, libegads_include), Cint, (Ptr{Void}, Ptr{Cdouble}, Ptr{Ptr{Void}}), gridP, uvnew, newGridP)
end

function eggInfo(gridP, npnt, nbnd, uv, p, ntri, tris)
    ccall((:eggInfo, libegads_include), Cint, (Ptr{Void}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cint}}, Ptr{Cint}, Ptr{Ptr{Cint}}), gridP, npnt, nbnd, uv, p, ntri, tris)
end

# function eggDump(gridP, fp)
#     ccall((:eggDump, libegads_include), Cint, (Ptr{Void}, Ptr{FILE}), gridP, fp)
# end
#
# function eggLoad(fp, gridP)
#     ccall((:eggLoad, libegads_include), Cint, (Ptr{FILE}, Ptr{Ptr{Void}}), fp, gridP)
# end

function eggFree(gridP)
    ccall((:eggFree, libegads_include), Cint, (Ptr{Void},), gridP)
end
# Julia wrapper for header: EngSketchPad/include/emp.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function EMP_Init(start)
    ccall((:EMP_Init, libegads_include), Cint, (Ptr{Clong},), start)
end

function EMP_Done(start)
    ccall((:EMP_Done, libegads_include), Clong, (Ptr{Clong},), start)
end

function EMP_ThreadCreate(entry, arg)
    ccall((:EMP_ThreadCreate, libegads_include), Ptr{Void}, (Ptr{Void}, Ptr{Void}), entry, arg)
end

function EMP_ThreadExit()
    ccall((:EMP_ThreadExit, libegads_include), Void, ())
end

function EMP_ThreadWait(thread)
    ccall((:EMP_ThreadWait, libegads_include), Void, (Ptr{Void},), thread)
end

function EMP_ThreadSpin()
    ccall((:EMP_ThreadSpin, libegads_include), Void, ())
end

function EMP_ThreadID()
    ccall((:EMP_ThreadID, libegads_include), Clong, ())
end

function EMP_ThreadDestroy(thread)
    ccall((:EMP_ThreadDestroy, libegads_include), Void, (Ptr{Void},), thread)
end

function EMP_LockCreate()
    ccall((:EMP_LockCreate, libegads_include), Ptr{Void}, ())
end

function EMP_LockSet(lock)
    ccall((:EMP_LockSet, libegads_include), Void, (Ptr{Void},), lock)
end

function EMP_LockTest(lock)
    ccall((:EMP_LockTest, libegads_include), Cint, (Ptr{Void},), lock)
end

function EMP_LockRelease(lock)
    ccall((:EMP_LockRelease, libegads_include), Void, (Ptr{Void},), lock)
end

function EMP_LockDestroy(lock)
    ccall((:EMP_LockDestroy, libegads_include), Void, (Ptr{Void},), lock)
end

function EMP_for(maxproc::Cint, nindex::Cint, forFn)
    ccall((:EMP_for, libegads_include), Cint, (Cint, Cint, Ptr{Void}), maxproc, nindex, forFn)
end

function EMP_sum(maxproc::Cint, nindex::Cint, sumFn, sum)
    ccall((:EMP_sum, libegads_include), Cint, (Cint, Cint, Ptr{Void}, Ptr{Cdouble}), maxproc, nindex, sumFn, sum)
end

function EMP_min(maxproc::Cint, nindex::Cint, minFn, min, imin)
    ccall((:EMP_min, libegads_include), Cint, (Cint, Cint, Ptr{Void}, Ptr{Cdouble}, Ptr{Cint}), maxproc, nindex, minFn, min, imin)
end
# Julia wrapper for header: EngSketchPad/include/prm.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function prm_CreateU(nvrt::Cint, u, xyz, tol::Cdouble, periodic)
    ccall((:prm_CreateU, libegads_include), Cint, (Cint, Ptr{Cdouble}, Ptr{prmXYZ}, Cdouble, Ptr{Cint}), nvrt, u, xyz, tol, periodic)
end

function prm_CreateUV(UVtype::Cint, ntri::Cint, tri, uvf, nvrt::Cint, ptype, pindx, uv, xyz, periodic, ppnts)
    ccall((:prm_CreateUV, libegads_include), Cint, (Cint, Cint, Ptr{prmTri}, Ptr{prmUVF}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{prmUV}, Ptr{prmXYZ}, Ptr{Cint}, Ptr{Ptr{Cint}}), UVtype, ntri, tri, uvf, nvrt, ptype, pindx, uv, xyz, periodic, ppnts)
end

function prm_SmoothU(periodic::Cint, nvrt::Cint, nvar::Cint, u, xyz)
    ccall((:prm_SmoothU, libegads_include), Cint, (Cint, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}), periodic, nvrt, nvar, u, xyz)
end

function prm_SmoothUV(_type::Cint, periodic::Cint, ppnts, ntri::Cint, tri, nvrt::Cint, nvar::Cint, uv, xyz)
    ccall((:prm_SmoothUV, libegads_include), Cint, (Cint, Cint, Ptr{Cint}, Cint, Ptr{prmTri}, Cint, Cint, Ptr{prmUV}, Ptr{Cdouble}), _type, periodic, ppnts, ntri, tri, nvrt, nvar, uv, xyz)
end

function prm_NormalizeU(halo::Cdouble, periodic::Cint, nvrt::Cint, u)
    ccall((:prm_NormalizeU, libegads_include), Cint, (Cdouble, Cint, Cint, Ptr{Cdouble}), halo, periodic, nvrt, u)
end

function prm_NormalizeUV(halo::Cdouble, periodic::Cint, nvrt::Cint, uv)
    ccall((:prm_NormalizeUV, libegads_include), Cint, (Cdouble, Cint, Cint, Ptr{prmUV}), halo, periodic, nvrt, uv)
end

function prm_LimitGridSize(limit::Cint)
    ccall((:prm_LimitGridSize, libegads_include), Cint, (Cint,), limit)
end

function prm_FixedCfit(nvrt::Cint, nvar::Cint, u, var, periodic::Cint, nu::Cint, cfit, rmserr, maxerr)
    ccall((:prm_FixedCfit, libegads_include), Cint, (Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), nvrt, nvar, u, var, periodic, nu, cfit, rmserr, maxerr)
end

function prm_FixedGrid(nvrt::Cint, nvar::Cint, uv, var, ntri::Cint, tri, periodic::Cint, ppnts, nu::Cint, nv::Cint, grid, rmserr, maxerr, dotmin)
    ccall((:prm_FixedGrid, libegads_include), Cint, (Cint, Cint, Ptr{prmUV}, Ptr{Cdouble}, Cint, Ptr{prmTri}, Cint, Ptr{Cint}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), nvrt, nvar, uv, var, ntri, tri, periodic, ppnts, nu, nv, grid, rmserr, maxerr, dotmin)
end

function prm_BestCfit(nvrt::Cint, nvar::Cint, u, var, tol::Cdouble, periodic::Cint, nu, cfit, rmserr, maxerr)
    ccall((:prm_BestCfit, libegads_include), Cint, (Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}, Ptr{Ptr{Cdouble}}, Ptr{Cdouble}, Ptr{Cdouble}), nvrt, nvar, u, var, tol, periodic, nu, cfit, rmserr, maxerr)
end

function prm_BestGrid(nvrt::Cint, nvar::Cint, uv, var, ntri::Cint, tri, tol::Cdouble, periodic::Cint, ppnts, nu, nv, grid, rmserr, maxerr, dotmin)
    ccall((:prm_BestGrid, libegads_include), Cint, (Cint, Cint, Ptr{prmUV}, Ptr{Cdouble}, Cint, Ptr{prmTri}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cdouble}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), nvrt, nvar, uv, var, ntri, tri, tol, periodic, ppnts, nu, nv, grid, rmserr, maxerr, dotmin)
end

function prm_EvalCfit(tree::cfitTree, uu::Cdouble, var, dt, dtt)
    ccall((:prm_EvalCfit, libegads_include), Cint, (cfitTree, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), tree, uu, var, dt, dtt)
end

function prm_EvalGrid(tree::gridTree, uv::prmUV, var, du, dv, duu, duv, dvv)
    ccall((:prm_EvalGrid, libegads_include), Cint, (gridTree, prmUV, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), tree, uv, var, du, dv, duu, duv, dvv)
end

function prm_FreeCfit(tree)
    ccall((:prm_FreeCfit, libegads_include), Cint, (Ptr{cfitTree},), tree)
end

function prm_FreeGrid(tree)
    ccall((:prm_FreeGrid, libegads_include), Cint, (Ptr{gridTree},), tree)
end
