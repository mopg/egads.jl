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
export EG_open, EG_makeSolidBody, EG_solidBoolean, EG_saveModel
export EG_getTopology, EG_deleteObject, EG_close
export EG_makeTopology, EG_makeGeometry, EG_getContext
export EG_invEvaluate, EG_makeFace, EG_otherCurve, EG_getRange, EG_filletBody
export EG_matchBodyFaces, EG_sewFaces, EG_join

# own functions
export getBodyFromModel, cleanup

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
