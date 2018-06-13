# ---------------------------------------------------------------------------- #
#
#   types_and_consts_egads.jl
#
#   Definition of types and constants in Julia from egads. This file is
#     automatically generated using the Clang.jl C-wrapper.
#
#   egads.jl
#   Spring 2018
#
#   Max Opgenoord
#
# ---------------------------------------------------------------------------- #

# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat

const EGADS_READERR = Int32(-32)
const EGADS_TESSTATE = Int32(-31)
const EGADS_EXISTS = Int32(-30)
const EGADS_ATTRERR = Int32(-29)
const EGADS_TOPOCNT = Int32(-28)
const EGADS_OCSEGFLT = Int32(-27)
const EGADS_BADSCALE = Int32(-26)
const EGADS_NOTORTHO = Int32(-25)
const EGADS_DEGEN = Int32(-24)
const EGADS_CONSTERR = Int32(-23)
const EGADS_TOPOERR = Int32(-22)
const EGADS_GEOMERR = Int32(-21)
const EGADS_NOTBODY = Int32(-20)
const EGADS_WRITERR = Int32(-19)
const EGADS_NOTMODEL = Int32(-18)
const EGADS_NOLOAD = Int32(-17)
const EGADS_RANGERR = Int32(-16)
const EGADS_NOTGEOM = Int32(-15)
const EGADS_NOTTESS = Int32(-14)
const EGADS_EMPTY = Int32(-13)
const EGADS_NOTTOPO = Int32(-12)
const EGADS_REFERCE = Int32(-11)
const EGADS_NOTXFORM = Int32(-10)
const EGADS_NOTCNTX = Int32(-9)
const EGADS_MIXCNTX = Int32(-8)
const EGADS_NODATA = Int32(-7)
const EGADS_NONAME = Int32(-6)
const EGADS_INDEXERR = Int32(-5)
const EGADS_MALLOC = Int32(-4)
const EGADS_NOTOBJ = Int32(-3)
const EGADS_NULLOBJ = Int32(-2)
const EGADS_NOTFOUND = Int32(-1)
const EGADS_SUCCESS = Int32(0)
const EGADS_OUTSIDE = Int32(1)
const EGADSMAJOR = Int32(1)
const EGADSMINOR = Int32(12)

# Skipping MacroDefinition: EGADSPROP EGADSprop : Revision 1.12 #

const MAGIC = Int32(98789)
const MTESSPARAM = Int32(2)
const CONTXT = Int32(0)
const TRANSFORM = Int32(1)
const TESSELLATION = Int32(2)
const NIL = Int32(3)
const EMPTY = Int32(4)
const REFERENCE = Int32(5)
const PCURVE = Int32(10)
const CURVE = Int32(11)
const SURFACE = Int32(12)
const NODE = Int32(20)
const EDGE = Int32(21)
const LOOP = Int32(22)
const FACE = Int32(23)
const SHELL = Int32(24)
const BODY = Int32(25)
const MODEL = Int32(26)
const LINE = Int32(1)
const CIRCLE = Int32(2)
const ELLIPSE = Int32(3)
const PARABOLA = Int32(4)
const HYPERBOLA = Int32(5)
const TRIMMED = Int32(6)
const BEZIER = Int32(7)
const BSPLINE = Int32(8)
const OFFSET = Int32(9)
const PLANE = Int32(1)
const SPHERICAL = Int32(2)
const CYLINDRICAL = Int32(3)
const REVOLUTION = Int32(4)
const TOROIDAL = Int32(5)
const CONICAL = Int32(10)
const EXTRUSION = Int32(11)
const SREVERSE = Int32(-1)
const NOMTYPE = Int32(0)
const SFORWARD = Int32(1)
const ONENODE = Int32(1)
const TWONODE = Int32(2)
const OPEN = Int32(3)
const CLOSED = Int32(4)
const DEGENERATE = Int32(5)
const WIREBODY = Int32(6)
const FACEBODY = Int32(7)
const SHEETBODY = Int32(8)
const SOLIDBODY = Int32(9)
const ATTRINT = Int32(1)
const ATTRREAL = Int32(2)
const ATTRSTRING = Int32(3)
const ATTRCSYS = Int32(12)
const ATTRPTR = Int32(13)
const SUBTRACTION = Int32(1)
const INTERSECTION = Int32(2)
const FUSION = Int32(3)
const BOX = Int32(1)
const SPHERE = Int32(2)
const CONE = Int32(3)
const CYLINDER = Int32(4)
const TORUS = Int32(5)
const UISO = Int32(0)
const VISO = Int32(1)
const NODEOFF = Int32(1)
const EDGEOFF = Int32(2)
const FACEDUP = Int32(3)
const FACECUT = Int32(4)
const FACEOFF = Int32(5)

mutable struct egAttr
    name::Cstring
    _type::Cint
    length::Cint
    vals::Void
end

mutable struct egAttrs
    nattrs::Cint
    attrs::Ptr{egAttr}
end

mutable struct egObject
    magicnumber::Cint
    oclass::Int16
    mtype::Int16
    attrs::Ptr{Void}
    blind::Ptr{Void}
    topObj::Ptr{egObject}
    tref::Ptr{egObject}
    prev::Ptr{egObject}
    next::Ptr{egObject}
end

const ego = Ptr{egObject}

const NULL_E = ego(0)

mutable struct egCntxt
    outLevel::Cint
    tess::NTuple{2, Cdouble}
    signature::Ptr{Cstring}
    usrPtr::Ptr{Void}
    pool::Ptr{egObject}
    last::Ptr{egObject}
end

mutable struct egFconn
    index::Cint
    nface::Cint
    faces::Ptr{Cint}
    tric::Ptr{Cint}
end

mutable struct egBary
    tri::Cint
    w::NTuple{2, Cdouble}
end

mutable struct egTess1D
    obj::Ptr{egObject}
    nodes::NTuple{2, Cint}
    faces::NTuple{2, egFconn}
    xyz::Ptr{Cdouble}
    t::Ptr{Cdouble}
    _global::Ptr{Cint}
    npts::Cint
end

mutable struct egPatch
    ipts::Ptr{Cint}
    bounds::Ptr{Cint}
    nu::Cint
    nv::Cint
end

mutable struct egTess2D
    mKnots::Ptr{egObject}
    xyz::Ptr{Cdouble}
    uv::Ptr{Cdouble}
    _global::Ptr{Cint}
    ptype::Ptr{Cint}
    pindex::Ptr{Cint}
    bary::Ptr{egBary}
    frame::Ptr{Cint}
    frlps::Ptr{Cint}
    tris::Ptr{Cint}
    tric::Ptr{Cint}
    patch::Ptr{egPatch}
    npts::Cint
    nframe::Cint
    nfrlps::Cint
    ntris::Cint
    npatch::Cint
    tfi::Cint
end

mutable struct egTessel
    src::Ptr{egObject}
    xyzs::Ptr{Cdouble}
    tess1d::Ptr{egTess1D}
    tess2d::Ptr{egTess2D}
    globals::Ptr{Cint}
    params::NTuple{6, Cdouble}
    tparam::NTuple{2, Cdouble}
    nGlobal::Cint
    nEdge::Cint
    nFace::Cint
    nu::Cint
    nv::Cint
    done::Cint
end

# Skipping MacroDefinition: CHECK_STATUS ( X ) if ( status < SUCCESS ) { printf ( "ERROR:: BAD STATUS = %d from %s (called from %s:%d)\n" , status , # X , routine , __LINE__ ) ; goto cleanup ; } #
# Skipping MacroDefinition: SET_STATUS ( STAT , X ) status = STAT ; printf ( "ERROR:: BAD STATUS = %d from %s (called from %s:%d)\n" , status , # X , routine , __LINE__ ) ; goto cleanup ; #
# Skipping MacroDefinition: MALLOC ( PTR , TYPE , SIZE ) DPRINT3 ( "mallocing %s in routine %s (size=%d)" , # PTR , routine , SIZE ) ; if ( PTR != NULL ) { printf ( "ERROR:: MALLOC overwrites for %s=%llx (called from %s:%d)\n" , # PTR , ( long long ) PTR , routine , __LINE__ ) ; status = BAD_MALLOC ; goto cleanup ; } PTR = ( TYPE * ) malloc ( ( SIZE ) * sizeof ( TYPE ) ) ; if ( PTR == NULL ) { printf ( "ERROR:: MALLOC PROBLEM for %s (called from %s:%d)\n" , # PTR , routine , __LINE__ ) ; status = BAD_MALLOC ; goto cleanup ; } #
# Skipping MacroDefinition: RALLOC ( PTR , TYPE , SIZE ) DPRINT3 ( "rallocing %s in routine %s (size=%d)" , # PTR , routine , SIZE ) ; if ( PTR == NULL ) { MALLOC ( PTR , TYPE , SIZE ) ; } else { realloc_temp = realloc ( PTR , ( SIZE ) * sizeof ( TYPE ) ) ; if ( PTR == NULL ) { printf ( "ERROR:: RALLOC PROBLEM for %s (called from %s:%d)\n" , # PTR , routine , __LINE__ ) ; status = BAD_MALLOC ; goto cleanup ; } else { PTR = ( TYPE * ) realloc_temp ; } } #
# Skipping MacroDefinition: FREE ( PTR ) if ( PTR != NULL ) { DPRINT2 ( "freeing %s in routine %s" , # PTR , routine ) ; free ( PTR ) ; } PTR = NULL ; /* macros for debug printing */
# Skipping MacroDefinition: DPRINT0 ( FORMAT ) #
# Skipping MacroDefinition: DPRINT0x ( FORMAT ) #
# Skipping MacroDefinition: DPRINT1 ( FORMAT , A ) #
# Skipping MacroDefinition: DPRINT1x ( FORMAT , A ) #
# Skipping MacroDefinition: DPRINT2 ( FORMAT , A , B ) #
# Skipping MacroDefinition: DPRINT2x ( FORMAT , A , B ) #
# Skipping MacroDefinition: DPRINT3 ( FORMAT , A , B , C ) #
# Skipping MacroDefinition: DPRINT3x ( FORMAT , A , B , C ) #
# Skipping MacroDefinition: DPRINT4 ( FORMAT , A , B , C , D ) #
# Skipping MacroDefinition: DPRINT4x ( FORMAT , A , B , C , D ) #
# Skipping MacroDefinition: DPRINT5 ( FORMAT , A , B , C , D , E ) #
# Skipping MacroDefinition: DPRINT6 ( FORMAT , A , B , C , D , E , F ) #
# Skipping MacroDefinition: DPRINT7 ( FORMAT , A , B , C , D , E , F , G ) #
# Skipping MacroDefinition: DPRINT7x ( FORMAT , A , B , C , D , E , F , G ) #
# Skipping MacroDefinition: DPRINT8 ( FORMAT , A , B , C , D , E , F , G , H ) #
# Skipping MacroDefinition: DPRINT9 ( FORMAT , A , B , C , D , E , F , G , H , I ) #
# Skipping MacroDefinition: DPRINT10 ( FORMAT , A , B , C , D , E , F , G , H , I , J ) #
# Skipping MacroDefinition: DPRINT11 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K ) #
# Skipping MacroDefinition: DPRINT12 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L ) #
# Skipping MacroDefinition: DPRINT13 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M ) #
# Skipping MacroDefinition: DPRINT14 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N ) #
# Skipping MacroDefinition: DPRINT15 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N , O ) #
# Skipping MacroDefinition: ROUTINE ( NAME ) char routine [ ] = # NAME ; if ( routine [ 0 ] == '\0' ) printf ( "bad routine(%s)\n" , routine ) ; /* macros for status printing */
# Skipping MacroDefinition: SPRINT0 ( OL , FORMAT ) DPRINT0 ( FORMAT ) ; if ( outLevel >= OL ) { printf ( FORMAT ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT0x ( OL , FORMAT ) DPRINT0x ( FORMAT ) ; if ( outLevel >= OL ) { printf ( FORMAT ) ; fflush ( stdout ) ; } #
# Skipping MacroDefinition: SPRINT1 ( OL , FORMAT , A ) DPRINT1 ( FORMAT , A ) ; if ( outLevel >= OL ) { printf ( FORMAT , A ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT1x ( OL , FORMAT , A ) DPRINT1x ( FORMAT , A ) ; if ( outLevel >= OL ) { printf ( FORMAT , A ) ; fflush ( stdout ) ; } #
# Skipping MacroDefinition: SPRINT2 ( OL , FORMAT , A , B ) DPRINT2 ( FORMAT , A , B ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT2x ( OL , FORMAT , A , B ) DPRINT2x ( FORMAT , A , B ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B ) ; fflush ( stdout ) ; } #
# Skipping MacroDefinition: SPRINT3 ( OL , FORMAT , A , B , C ) DPRINT3 ( FORMAT , A , B , C ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT3x ( OL , FORMAT , A , B , C ) DPRINT3x ( FORMAT , A , B , C ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C ) ; fflush ( stdout ) ; } #
# Skipping MacroDefinition: SPRINT4 ( OL , FORMAT , A , B , C , D ) DPRINT4 ( FORMAT , A , B , C , D ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT4x ( OL , FORMAT , A , B , C , D ) DPRINT4x ( FORMAT , A , B , C , D ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D ) ; fflush ( stdout ) ; } #
# Skipping MacroDefinition: SPRINT5 ( OL , FORMAT , A , B , C , D , E ) DPRINT5 ( FORMAT , A , B , C , D , E ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT6 ( OL , FORMAT , A , B , C , D , E , F ) DPRINT6 ( FORMAT , A , B , C , D , E , F ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT7 ( OL , FORMAT , A , B , C , D , E , F , G ) DPRINT7 ( FORMAT , A , B , C , D , E , F , G ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT8 ( OL , FORMAT , A , B , C , D , E , F , G , H ) DPRINT8 ( FORMAT , A , B , C , D , E , F , G , H ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT9 ( OL , FORMAT , A , B , C , D , E , F , G , H , I ) DPRINT9 ( FORMAT , A , B , C , D , E , F , G , H , I ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H , I ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT10 ( OL , FORMAT , A , B , C , D , E , F , G , H , I , J ) DPRINT10 ( FORMAT , A , B , C , D , E , F , G , H , I , J ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H , I , J ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT11 ( OL , FORMAT , A , B , C , D , E , F , G , H , I , J , K ) DPRINT11 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H , I , J , K ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT12 ( OL , FORMAT , A , B , C , D , E , F , G , H , I , J , K , L ) DPRINT12 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT13 ( OL , FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M ) DPRINT13 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT14 ( OL , FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N ) DPRINT14 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N ) ; printf ( "\n" ) ; } #
# Skipping MacroDefinition: SPRINT15 ( OL , FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N , O ) DPRINT15 ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N , O ) ; if ( outLevel >= OL ) { printf ( FORMAT , A , B , C , D , E , F , G , H , I , J , K , L , M , N , O ) ; printf ( "\n" ) ; } /* error codes */

const BAD_MALLOC = -900
const PI = 3.141592653589793
const TWOPI = 6.283185307179586
const PIo2 = 1.5707963267948966
const PIo4 = 0.7853981633974483
const PIo180 = 0.017453292519943295
const HUGEQ = 9.9999999e7
const HUGEI = 9999999
const EPS03 = 0.001
const EPS06 = 1.0e-6
const EPS12 = 1.0e-12
const EPS20 = 1.0e-20

# Skipping MacroDefinition: SQR ( A ) ( ( A ) * ( A ) ) #
# Skipping MacroDefinition: NINT ( A ) ( ( ( A ) < 0 ) ? ( int ) ( A - 0.5 ) : ( int ) ( A + 0.5 ) ) #
# Skipping MacroDefinition: MIN ( A , B ) ( ( ( A ) < ( B ) ) ? ( A ) : ( B ) ) #
# Skipping MacroDefinition: MAX ( A , B ) ( ( ( A ) < ( B ) ) ? ( B ) : ( A ) ) #
# Skipping MacroDefinition: MINMAX ( A , B , C ) MIN ( MAX ( ( A ) , ( B ) ) , ( C ) ) #
# Skipping MacroDefinition: SIGN ( A ) ( ( ( A ) < 0 ) ? - 1 : ( ( ( A ) > 0 ) ? + 1 : 0 ) ) #
# Skipping MacroDefinition: FSIGN ( A , B ) ( ( B ) >= 0 ? fabs ( A ) : - fabs ( A ) ) #

const CHUNK = 256
const MAXELEN = 2048
const DEGENUV = 1.0e-14

mutable struct KEY
    keys::NTuple{3, Cint}
end

mutable struct DATA
    close::Cint
    xyz::NTuple{3, Cdouble}
end

mutable struct ENTRY
    key::KEY
    data::DATA
end

mutable struct element
    item::ENTRY
    next::Ptr{element}
end

mutable struct ELEMENT
    item::ENTRY
    next::Ptr{element}
end

mutable struct triVert
    _type::Cint
    edge::Cint
    index::Cint
    xyz::NTuple{3, Cdouble}
    uv::NTuple{2, Cdouble}
end

mutable struct triTri
    indices::NTuple{3, Cint}
    neighbors::NTuple{3, Cint}
    mid::NTuple{3, Cdouble}
    area::Cdouble
    mark::Int16
    close::Int16
    hit::Int16
    count::Int16
end

mutable struct triSeg
    indices::NTuple{2, Cint}
    neighbor::Cint
    edge::Cint
    index::Cint
end

mutable struct triStruct
    face::Ptr{Cint}
    fIndex::Cint
    orUV::Cint
    planar::Cint
    phase::Cint
    VoverU::Cdouble
    maxlen::Cdouble
    chord::Cdouble
    dotnrm::Cdouble
    accum::Cdouble
    edist2::Cdouble
    eps2::Cdouble
    devia2::Cdouble
    minlen::Cdouble
    range::NTuple{4, Cdouble}
    qparm::NTuple{3, Cdouble}
    uvs::Ptr{Cdouble}
    orCnt::Cint
    maxPts::Cint
    mverts::Cint
    nverts::Cint
    verts::Ptr{triVert}
    mtris::Cint
    ntris::Cint
    tris::Ptr{triTri}
    msegs::Cint
    nsegs::Cint
    segs::Ptr{triSeg}
    nfrvrts::Cint
    mframe::Cint
    nframe::Cint
    frame::Ptr{Cint}
    mloop::Cint
    nloop::Cint
    loop::Ptr{Cint}
    lens::NTuple{5, Cint}
    numElem::Cint
    tfi::Cint
    hashTab::Ptr{Ptr{ELEMENT}}
end

mutable struct Front
    sleft::Cint
    i0::Cint
    i1::Cint
    sright::Cint
    snew::Int16
    mark::Int16
end

mutable struct fillArea
    mfront::Cint
    nfront::Cint
    mpts::Cint
    npts::Cint
    pts::Ptr{Cint}
    nsegs::Cint
    segs::Ptr{Cint}
    front::Ptr{Front}
end

mutable struct connect
    node1::Cint
    node2::Cint
    tri::Ptr{Cint}
    thread::Cint
end

mutable struct EMPtess
    mutex::Ptr{Void}
    master::Clong
    _end::Cint
    index::Cint
    ignore::Cint
    mark::Ptr{Cint}
    tess::Ptr{Cint}
    btess::Ptr{Cint}
    body::Ptr{Cint}
    faces::Ptr{Ptr{Cint}}
    edges::Ptr{Ptr{Cint}}
    params::Ptr{Cdouble}
    tparam::Ptr{Cdouble}
    qparam::NTuple{3, Cdouble}
    ptr::Ptr{Void}
end

const SUCCESS = 0
const MALLOC_ERROR = -901
const BAD_POINT_INDEX = -902
const BAD_TRIANGLE_INDEX = -903
const CANNOT_SWAP = -904
const COULD_NOT_RECOVER_BND = -905
const NUMBER_OF_POINT_MISMATCH = -906
const PRM_OK_ONEFACE = 1
const PRM_OK_SIMPLE = 2
const PRM_OK_JONES = 3
const PRM_OK_AXIAL = 4
const PRM_OK_PLANAR = 5
const PRM_OK_FLOATER = 6
const PRM_OK_UNROLLING = 7
const PRM_NOTCONVERGED = -401
const PRM_BADNUMVERTICES = -402
const PRM_ZEROPIVOT = -403
const PRM_NEGATIVEAREAS = -404
const PRM_TOLERANCEUNMET = -405
const PRM_NOGLOBALUV = -406
const PRM_BADPARAM = -407
const PRM_BADDIVISION = -408
const PRM_CANNOTFORMLOOP = -409
const PRM_WIGGLEDETECTED = -410
const PRM_INTERNAL = -499

mutable struct prmXYZ
    x::Cdouble
    y::Cdouble
    z::Cdouble
end

mutable struct prmUVF
    u0::Cdouble
    v0::Cdouble
    u1::Cdouble
    v1::Cdouble
    u2::Cdouble
    v2::Cdouble
end

mutable struct prmUV
    u::Cdouble
    v::Cdouble
end

mutable struct prmTri
    indices::NTuple{3, Cint}
    neigh::NTuple{3, Cint}
    own::Cint
end

mutable struct cfitCell
    wKnot::Cint
    eKnot::Cint
    wCell::Cint
    eCell::Cint
    child::Cint
    count::Cint
    umin::Cdouble
    umax::Cdouble
    rmserr::Cdouble
    maxerr::Cdouble
end

mutable struct cfitTree
    nvar::Cint
    nu::Cint
    ncel::Cint
    cell::Ptr{cfitCell}
    nknt::Cint
    knot::Ptr{Cdouble}
end

mutable struct gridCell
    swKnot::Cint
    seKnot::Cint
    nwKnot::Cint
    neKnot::Cint
    wCell::Cint
    eCell::Cint
    sCell::Cint
    nCell::Cint
    dtype::Cint
    child::Cint
    count::Cint
    umin::Cdouble
    umax::Cdouble
    vmin::Cdouble
    vmax::Cdouble
    rmserr::Cdouble
    maxerr::Cdouble
end

mutable struct gridTree
    nvar::Cint
    nu::Cint
    nv::Cint
    ncel::Cint
    cell::Ptr{gridCell}
    nknt::Cint
    knot::Ptr{Cdouble}
end
