# ---------------------------------------------------------------------------- #
#
#   export.jl
#
#   List of functions and constants that are exposed outside of the package
#
#   jegads
#   Spring 2018
#
#   Max Opgenoord
#
# ---------------------------------------------------------------------------- #

# functions
export EG_alloc, EG_calloc, EG_reall, EG_free, EG_revision, EG_open,
    EG_loadModel, EG_saveModel, EG_deleteObject, EG_makeTransform,
    EG_getTransformation, EG_getContext, EG_setOutLevel, EG_getInfo,
    EG_copyObject, EG_flipObject, EG_close, EG_setUserPointer,
    EG_getUserPointer, EG_attributeAdd, EG_attributeDel, EG_attributeNum,
    EG_attributeGet, EG_attributeRet, EG_attributeDup, EG_getGeometry,
    EG_makeGeometry, EG_getRange, EG_evaluate, EG_invEvaluate,
    EG_invEvaluateGuess, EG_arcLength, EG_curvature, EG_approximate,
    EG_fitTriangles, EG_otherCurve, EG_isSame, EG_isoCline,
    EG_convertToBSpline, EG_convertToBSplineRange, EG_skinning,
    EG_tolerance, EG_getTolerance, EG_setTolerance, EG_getTopology,
    EG_makeTopology, EG_makeLoop, EG_getArea, EG_makeFace, EG_getBodyTopos,
    EG_indexBodyTopo, EG_objectBodyTopo, EG_inTopology, EG_inFace,
    EG_getEdgeUV, EG_getPCurve, EG_getBody, EG_makeSolidBody,
    EG_getBoundingBox, EG_getMassProperties, EG_isEquivalent,
    EG_sewFaces, EG_replaceFaces, EG_mapBody, EG_matchBodyFaces,
    EG_setTessParam, EG_makeTessGeom, EG_getTessGeom, EG_makeTessBody,
    EG_remakeTess, EG_mapTessBody, EG_locateTessBody, EG_getTessEdge,
    EG_getTessFace, EG_getTessLoops, EG_getTessQuads,
    EG_makeQuads, EG_getQuads, EG_getPatch, EG_quadTess, EG_insertEdgeVerts,
    EG_deleteEdgeVert, EG_moveEdgeVert, EG_openTessBody, EG_initTessBody,
    EG_statusTessBody, EG_setTessEdge, EG_setTessFace, EG_localToGlobal,
    EG_getGlobal, EG_solidBoolean, EG_intersection, EG_imprintBody, EG_filletBody,
    EG_chamferBody, EG_hollowBody, EG_extrude, EG_rotate, EG_sweep, EG_loft,
    EG_blend, EG_ruled, EG_blend_init, EG_blend_pos, EG_blend_sens, EG_blend_seval,
    EG_sens_free, EG_spline1dEval, EG_spline1dEval_psens, EG_spline1dDeriv,
    EG_spline1dFit, EG_spline1dFit_psens, EG_spline2dEval, EG_spline2dEval_psens,
    EG_spline2dDeriv, EG_spline2dAprx, eggGenerate, eggMorph, eggInfo, eggFree,
    EMP_Init, EMP_Done, EMP_ThreadCreate, EMP_ThreadExit, EMP_ThreadWait,
    EMP_ThreadSpin, EMP_ThreadID, EMP_ThreadDestroy, EMP_LockCreate, EMP_LockSet,
    EMP_LockTest, EMP_LockRelease, EMP_LockDestroy, EMP_for, EMP_sum, EMP_min,
    prm_CreateU, prm_CreateUV, prm_SmoothU, prm_SmoothUV, prm_NormalizeU, prm_NormalizeUV,
    prm_LimitGridSize, prm_FixedCfit, prm_FixedGrid, prm_BestCfit, prm_BestGrid,
    prm_EvalCfit, prm_EvalGrid, prm_FreeCfit, prm_FreeGrid

# own functions
export getBodyFromModel, cleanup, EG_join, EG_getBodyFaces

# types
export ego

# null pointer
export NULL_E

# constants
export MAGIC, MTESSPARAM, CONTXT, TRANSFORM, TESSELLATION,NIL, EMPTY
export REFERENCE, PCURVE, CURVE, SURFACE, NODE, EDGE, LOOP, FACE, SHELL
export BODY, MODEL, LINE, CIRCLE, ELLIPSE, PARABOLA, HYPERBOLA, TRIMMED
export BEZIER, BSPLINE, OFFSET, PLANE, SPHERICAL, CYLINDRICAL, REVOLUTION
export TOROIDAL, CONICAL, EXTRUSION, SREVERSE, NOMTYPE, SFORWARD, ONENODE
export TWONODE, OPEN, CLOSED, DEGENERATE, WIREBODY, FACEBODY, SHEETBODY
export SOLIDBODY, ATTRINT, ATTRREAL, ATTRSTRING, ATTRCSYS, ATTRPTR, SUBTRACTION
export INTERSECTION,FUSION, BOX, SPHERE, CONE, CYLINDER, TORUS, UISO, VISO
export NODEOFF, EDGEOFF, FACEDUP, FACECUT, FACEOFF

export EGADS_READERR, EGADS_TESSTATE, EGADS_EXISTS, EGADS_ATTRERR, EGADS_TOPOCNT
export EGADS_OCSEGFLT, EGADS_BADSCALE, EGADS_NOTORTHO, EGADS_DEGEN
export EGADS_CONSTERR, EGADS_TOPOERR, EGADS_GEOMERR, EGADS_NOTBODY
export EGADS_WRITERR, EGADS_NOTMODEL, EGADS_NOLOAD, EGADS_RANGERR, EGADS_NOTGEOM
export EGADS_NOTTESS, EGADS_EMPTY, EGADS_NOTTOPO, EGADS_REFERCE, EGADS_NOTXFORM
export EGADS_NOTCNTX, EGADS_MIXCNTX, EGADS_NODATA, EGADS_NONAME, EGADS_INDEXERR
export EGADS_MALLOC, EGADS_NOTOBJ, EGADS_NULLOBJ, EGADS_NOTFOUND, EGADS_SUCCESS
export EGADS_OUTSIDE, EGADSMAJOR, EGADSMINOR
