using egads

# This is the tutorial case provided with EGADS

function periodicSeam(eedge::ego,   # Edge associated with seam
                      sense::Cint ) # sense of PCurve

    status = EGADS_SUCCESS
    range = fill(0.0,2)
    data  = fill(0.0,4)
    per   = Ref{Cint}(0)

    (context,status) = EG_getContext(eedge)
    if (status != EGADS_SUCCESS) return status end

    status = EG_getRange(eedge, range, per)
    if (status != EGADS_SUCCESS) return status end

    # set up u and v at ends
    data = [2*pi, range[1], 0.0, sense]
    if (sense == -1) data[2] = range[2] end

    # make (linear) PCurve
    (pcurve,status) =  EG_makeGeometry(context, PCURVE, LINE, NULL_E, C_NULL, data)

    return (pcurve, status)

end

# set the parameter values
width  =  5.0
minrad =  8.0
maxrad = 12.0
fillet =  2.0
thick  =  0.5
bolts  =  5
crad   =  5.0
brad   =  1.0

# initialize arrays
enodes   = fill( ego(0), 8 )
ecurve   = fill( ego(0), 16 )
eedges   = fill( ego(0), 16 )
elist    = fill( ego(0), 20 )
esurface = fill( ego(0), 4 )
efaces   = fill( ego(0), 8 )
epcurve  = fill( ego(0), 4 )
trange   = fill( 0.0, 2 )

# initialize pointers
NULL_E = ego(0)
NULL_I = Ref{Cint}(0)
NULL_D = Ref{Cdouble}(0.0)

(context, status) = EG_open( )
if (status < 0) error("Can't open, failure code: %i", status) end

# node locations
node1 = [-minrad, 0.0, -width/2.0]
node2 = [-minrad, 0.0,  width/2.0]
node3 = [-maxrad, 0.0,  width/2.0]
node4 = [-maxrad, 0.0, -width/2.0]
node5 = [ minrad, 0.0, -width/2.0]
node6 = [ maxrad, 0.0, -width/2.0]
node7 = [ maxrad, 0.0,  width/2.0]
node8 = [ minrad, 0.0,  width/2.0]

# make nodes

(enodes[1], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node1, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(enodes[2], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node2, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(enodes[3], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node3, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(enodes[4], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node4, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(enodes[5], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node5, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(enodes[6], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node6, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(enodes[7], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node7, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(enodes[8], status) = EG_makeTopology(context, NULL_E, NODE, Cint(0), node8, Cint(0), NULL_E, NULL_I)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 1
data = [node1[1], node1[2], node1[3], node2[1] - node1[1], node2[2] - node1[2], node2[3] - node1[3] ]
(ecurve[1], status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1], status) = EG_invEvaluate(ecurve[1], node1, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[1], node2, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[1]
elist[2] = enodes[2]
(eedges[1],status) = EG_makeTopology(context, ecurve[1], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 2
data = [ node2[1], node2[2], node2[3], node3[1] - node2[1], node3[2] - node2[2], node3[3] - node2[3] ]
(ecurve[2], status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[2], node2, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[2], node3, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[2]
elist[2] = enodes[3]
(eedges[2],status) = EG_makeTopology(context, ecurve[2], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 3
data = [ node3[1], node3[2], node3[3], node4[1] - node3[1], node4[2] - node3[2], node4[3] - node3[3] ]
(ecurve[3], status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[3], node3, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[3], node4, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[3]
elist[2] = enodes[4]
(eedges[3],status) = EG_makeTopology(context, ecurve[3], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 4
data = [ node4[1], node4[2], node4[3], node1[1] - node4[1], node1[2] - node4[2], node1[3] - node4[3] ]
(ecurve[4],status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[4], node4, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[4], node1, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[4]
elist[2] = enodes[1]
(eedges[4],status) = EG_makeTopology(context, ecurve[4], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 5
data = [node5[1], node5[2], node5[3], node6[1] - node5[1], node6[2] - node5[2], node6[3] - node5[3] ]
(ecurve[5],status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[5], node5, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[5], node6, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[5]
elist[2] = enodes[6]
(eedges[5],status) = EG_makeTopology(context, ecurve[5], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 6
data = [node6[1], node6[2], node6[3], node7[1] - node6[1], node7[2] - node6[2], node7[3] - node6[3] ]
(ecurve[6],status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, C_NULL, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[6], node6, data);
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[6], node7, data);
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[6]
elist[2] = enodes[7]
(eedges[6],status) = EG_makeTopology(context, ecurve[6], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 7
data = [node7[1], node7[2], node7[3], node8[1] - node7[1], node8[2] - node7[2], node8[3] - node7[3] ]
(ecurve[7],status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[7], node7, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[7], node8, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[7]
elist[2] = enodes[8]
(eedges[7],status) = EG_makeTopology(context, ecurve[7], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (linear) Edge 8
data = [node8[1], node8[2], node8[3], node5[1] - node8[1], node5[2] - node8[2], node5[3] - node8[3] ]
(ecurve[8],status) = EG_makeGeometry(context, CURVE, LINE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[8], node8, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[8], node5, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

elist[1] = enodes[8]
elist[2] = enodes[5]
(eedges[8],status) = EG_makeTopology(context, ecurve[8], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# data used in creating the arcs
axis1 = [1.0, 0.0, 0.0]
axis2 = [0.0, 1.0, 0.0]
axis3 = [0.0, 0.0, 1.0]

cent1 = [0.0, 0.0, -width / 2.0]
cent2 = [0.0, 0.0,  width / 2.0]

# make (circular) Edge 9
data = [cent1[1], cent1[2], cent1[3],
        axis1[1], axis1[2], axis1[3],
        axis2[1], axis2[2], axis2[3],
        minrad]
(ecurve[9],status) = EG_makeGeometry(context, CURVE, CIRCLE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[9], node5, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[9], node1, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end # ensure trange[2] > trange[1]

elist[1] = enodes[5];
elist[2] = enodes[1];
(eedges[9],status) = EG_makeTopology(context, ecurve[9], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (circular) Edge 10
data = [cent2[1], cent2[2], cent2[3],
        axis1[1], axis1[2], axis1[3],
        axis2[1], axis2[2], axis2[3],
        minrad]
(ecurve[10],status) = EG_makeGeometry(context, CURVE, CIRCLE, NULL_E, NULL_I, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[10], node8, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[10], node2, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end # ensure trange[2] > trange[1]

elist[1] = enodes[8]
elist[2] = enodes[2]
(eedges[10],status) = EG_makeTopology(context, ecurve[9], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (circular) Edge 11
data = [cent1[1], cent1[2], cent1[3],
        axis1[1], axis1[2], axis1[3],
        axis2[1], axis2[2], axis2[3], maxrad]
(ecurve[11],status) = EG_makeGeometry(context, CURVE, CIRCLE, NULL_E, C_NULL, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[11], node6, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[11], node4, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end  # ensure trange[2] > trange[1]

elist[1] = enodes[6]
elist[2] = enodes[4]
(eedges[11],status) = EG_makeTopology(context, ecurve[11], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (circular) Edge 12
data = [cent2[1], cent2[2], cent2[3],
        axis1[1], axis1[2], axis1[3],
        axis2[1], axis2[2], axis2[3], maxrad]
(ecurve[12], status) = EG_makeGeometry(context, CURVE, CIRCLE, NULL_E, C_NULL, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[1],status) = EG_invEvaluate(ecurve[12], node7, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[12], node3, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end   # ensure trange[2] > trange[1]

elist[1] = enodes[7]
elist[2] = enodes[3]
(eedges[12],status) = EG_makeTopology(context, ecurve[12], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make the outer cylindrical surface
data = [cent1[1], cent1[2], cent1[3],
        axis1[1], axis1[2], axis1[3],
        axis2[1], axis2[2], axis2[3],
        axis3[1], axis3[2], axis3[3], maxrad]
(esurface[1],status) = EG_makeGeometry(context, SURFACE, CYLINDRICAL, NULL_E, C_NULL, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(esurface[2],status) = EG_makeGeometry(context, SURFACE, CYLINDRICAL, NULL_E, C_NULL, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make the inner cylindrical surface
data = [cent1[1], cent1[2], cent1[3],
        axis1[1], axis1[2], axis1[3],
        axis2[1], axis2[2], axis2[3],
        axis3[1], axis3[2], axis3[3], minrad]
(esurface[3],status) = EG_makeGeometry(context, SURFACE, CYLINDRICAL, NULL_E, C_NULL, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(esurface[4],status) = EG_makeGeometry(context, SURFACE, CYLINDRICAL, NULL_E, C_NULL, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (planar) Face 1
sense = [SFORWARD, SREVERSE, SFORWARD, SFORWARD]
elist[1] = eedges[4]
elist[2] = eedges[9]
elist[3] = eedges[5]
elist[4] = eedges[11]
(eloop,status) = EG_makeTopology(context, NULL_E, LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[1],status) = EG_makeFace(eloop, SFORWARD, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (planar) Face 2
sense = [SFORWARD, SREVERSE, SFORWARD, SFORWARD]
elist[1] = eedges[2]
elist[2] = eedges[12]
elist[3] = eedges[7]
elist[4] = eedges[10]
(eloop,status) = EG_makeTopology(context, NULL_E, LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[2],status) = EG_makeFace(eloop, SFORWARD, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (cylindrical) Face 3
(epcurve[1],status) = EG_otherCurve(esurface[1], ecurve[3], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[2],status) = EG_otherCurve(esurface[1], ecurve[11], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[3],status) = EG_otherCurve(esurface[1], ecurve[6], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[4],status) = EG_otherCurve(esurface[1], ecurve[12], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

sense = [SFORWARD, SREVERSE, SFORWARD, SFORWARD]
elist = [eedges[3],  eedges[11], eedges[6],  eedges[12],
         epcurve[1], epcurve[2], epcurve[3], epcurve[4]]
(eloop,status) = EG_makeTopology(context, esurface[1], LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[3],status) = EG_makeTopology(context, esurface[1], FACE, SREVERSE, C_NULL, Cint(1), Ref{ego}(eloop), sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (cylindrical) Face 4
(epcurve[1],status) = EG_otherCurve(esurface[2], ecurve[1], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[2],status) = EG_otherCurve(esurface[2], ecurve[10], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[3],status) = EG_otherCurve(esurface[2], ecurve[8], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[4],status) = EG_otherCurve(esurface[2], ecurve[9], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

sense = [SFORWARD, SREVERSE, SFORWARD, SFORWARD]
elist = [eedges[1],  eedges[10], eedges[8], eedges[9],
         epcurve[1], epcurve[2], epcurve[3], epcurve[4]]
(eloop,status) = EG_makeTopology(context, esurface[2], LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[4],status) = EG_makeTopology(context, esurface[2], FACE, SFORWARD, C_NULL, Cint(1), Ref{ego}(eloop), sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("edge 12 done")
# make (circular) Edge 13
ecurve[13] = ecurve[9] # reuse

(trange[1],status) = EG_invEvaluate(ecurve[13], node1, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[13], node5, data);
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end   # ensure trange[2] > trange[1]

elist[1] = enodes[1]
elist[2] = enodes[5]
(eedges[13],status) = EG_makeTopology(context, ecurve[13], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("edge 13 done")
# make (circular) Edge 14
ecurve[14] = ecurve[10] # reuse

(trange[1],status) = EG_invEvaluate(ecurve[14], node2, data);
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[14], node8, data);
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end   # ensure trange[2] > trange[1]

elist[1] = enodes[2]
elist[2] = enodes[8]
(eedges[14],status) = EG_makeTopology(context, ecurve[14], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("edge 14 done")
# make (circular) Edge 15
ecurve[15] = ecurve[11]

(trange[1],status) = EG_invEvaluate(ecurve[14], node4, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[14], node6, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end   # ensure trange[2] > trange[1]

elist[1] = enodes[4]
elist[2] = enodes[6]
(eedges[15],status) = EG_makeTopology(context, ecurve[15], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("edge 15 done")
# make (circular) Edge 16
ecurve[16] = ecurve[12]

(trange[1],status) = EG_invEvaluate(ecurve[16], node3, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(trange[2],status) = EG_invEvaluate(ecurve[16], node7, data)
if (status != EGADS_SUCCESS) cleanup(status, context) end

if (trange[1] > trange[2]) trange[2] += 2*pi end   # ensure trange[2] > trange[1]

elist[1] = enodes[3]
elist[2] = enodes[7]
(eedges[16],status) = EG_makeTopology(context, ecurve[16], EDGE, TWONODE, trange, Cint(2), elist, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("edge 16 done")
# make (planar) Face 5
sense = [SFORWARD, SREVERSE, SREVERSE, SREVERSE]
elist = [eedges[15], eedges[5], eedges[13], eedges[4]]
(eloop,status) = EG_makeTopology(context, NULL_E, LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[5],status) = EG_makeFace(eloop, SFORWARD, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("face 5 done")
# make (planar) Face 6
sense = [SFORWARD, SREVERSE, SFORWARD, SFORWARD]
elist = [eedges[7], eedges[14], eedges[2], eedges[16]]
(eloop,status) = EG_makeTopology(context, NULL_E, LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[6],status) = EG_makeFace(eloop, SFORWARD, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("face 6 done")
# make (cylindrical) Face 7
(epcurve[1],status) = EG_otherCurve(esurface[3], ecurve[3], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[2],status) = EG_otherCurve(esurface[3], ecurve[15], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end
println("face 7 done")
# EG_otherCurve cannot be used along periodic seam
(epcurve[3],status) = periodicSeam(eedges[6], SFORWARD)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[4],status) = EG_otherCurve(esurface[3], ecurve[16], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

sense = [SFORWARD, SFORWARD, SFORWARD, SREVERSE]
elist = [eedges[3],  eedges[15], eedges[6],  eedges[16],
         epcurve[1], epcurve[2], epcurve[3], epcurve[4]]
(eloop,status) = EG_makeTopology(context, esurface[3], LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[7],status) = EG_makeTopology(context, esurface[3], FACE, SFORWARD, C_NULL, Cint(1), Ref{ego}(eloop), sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make (cylindrical) Face 8
(epcurve[1],status) = EG_otherCurve(esurface[4], ecurve[1], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[2],status) = EG_otherCurve(esurface[4], ecurve[14], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# EG_otherCurve cannot be used along periodic seam
(epcurve[3],status) = periodicSeam(eedges[8], SREVERSE)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(epcurve[4],status) = EG_otherCurve(esurface[4], ecurve[13], 0.0)
if (status != EGADS_SUCCESS) cleanup(status, context) end

sense = [SFORWARD, SFORWARD, SFORWARD, SREVERSE]
elist = [eedges[1],  eedges[14], eedges[8],  eedges[13],
         epcurve[1], epcurve[2], epcurve[3], epcurve[4]]
(eloop,status) = EG_makeTopology(context, esurface[4], LOOP, CLOSED, C_NULL, Cint(4), elist, sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(efaces[8],status) = EG_makeTopology(context, esurface[4], FACE, SREVERSE, C_NULL, Cint(1), Ref{ego}(eloop), sense)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# make the shell and initial Body
(eshell,status) = EG_makeTopology(context, NULL_E, SHELL, CLOSED, C_NULL, Cint(8), efaces, C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

(ebody1,status) = EG_makeTopology(context, NULL_E, BODY, SOLIDBODY, C_NULL, Cint(1), Ref{ego}(eshell), C_NULL)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# add fillets if desired (result is ebody2)
if (fillet > 0)
    elist = [ eedges[11], eedges[12], eedges[15], eedges[16] ]
    (ebody,status) = EG_filletBody(ebody1, Cint(4), elist, fillet, C_NULL)
    if (status != EGADS_SUCCESS) cleanup(status, context) end

    status = EG_deleteObject(ebody1);
    if (status != EGADS_SUCCESS)
        cleanup(status, context)
    else
        ebody2 = ebody1
    end
end
# add wheel if desired (result is source)
if (thick > 0)
    data = [ 0.0, 0.0,  thick / 2.0,
             0.0, 0.0, -thick / 2.0,
             (minrad + maxrad) / 2.0 ]
    (ebody3,status) = EG_makeSolidBody(context, CYLINDER, data)
    if (status != EGADS_SUCCESS) cleanup(status, context) end

    (emodel,status) = EG_solidBoolean(ebody2, ebody3, FUSION)
    if (status != EGADS_SUCCESS) cleanup(status, context) end

    status = EG_deleteObject(ebody2)
    if (status != EGADS_SUCCESS) cleanup(status, context) end

    status = EG_deleteObject(ebody3)
    if (status != EGADS_SUCCESS) cleanup(status, context) end

    status = EG_getTopology(emodel, &eref, &oclass, &mtype, data, &nchild, &echilds, &senses);
    if (status != EGADS_SUCCESS) cleanup(status, context) end

    if (oclass != MODEL || nchild != 1)
      @printf("You didn't input a model or are returning more than one body ochild = %d, nchild = %d/n", oclass, nchild);
      status = -999
      cleanup(status, context)
    end

    (source, status) = EG_copyObject(echilds[1], C_NULL)
    if (status != EGADS_SUCCESS) cleanup(status, context) end

    status = EG_deleteObject(emodel);
    cleanup(status, context)

    # add bolt holes
    for i in 1:bolts
        data[1] =  crad * cos(i * (2*pi / bolts))
        data[2] =  crad * sin(i * (2*pi / bolts))
        data[3] =  thick / 2.0
        data[4] =  crad * cos(i * (2*pi / bolts))
        data[5] =  crad * sin(i * (2*pi / bolts))
        data[6] = -thick / 2.0
        data[7] =  brad

        (ebody4,status) = EG_makeSolidBody(context, CYLINDER, data)
        if (status != EGADS_SUCCESS) cleanup(status, context) end

        (emodel,status) = EG_solidBoolean(source, ebody4, SUBTRACTION)
        if (status != EGADS_SUCCESS) cleanup(status, context) end

        status = EG_deleteObject(source)
        if (status != EGADS_SUCCESS) cleanup(status, context) end

        status = EG_deleteObject(ebody4)
        if (status != EGADS_SUCCESS) cleanup(status, context) end

        status = EG_getTopology(emodel, &eref, &oclass, &mtype, data, &nchild, &echilds2, &senses);
        if (status != EGADS_SUCCESS) cleanup(status, context) end

        if (oclass != MODEL || nchild != 1)
            @printf("You didn't input a model or are returning more than one body ochild = %d, nchild = %d/n", oclass, nchild);
            status = -999;
            cleanup(status, context)
        end

        (source,status) = EG_copyObject(echilds2[0], C_NULL)
        if (status != EGADS_SUCCESS) cleanup(status, context) end

        status = EG_deleteObject(emodel)
        if (status != EGADS_SUCCESS) cleanup(status, context) end
    end
    ebody = source
else
    ebody = ebody2
end

# make and dump the model
(emodel, status) = EG_makeTopology(context, C_NULL, MODEL, 0, C_NULL, 1, Ref{ego}(ebody), C_NULL)
printf("EG_makeTopology -> status=%d\n", status);
if (status < 0) exit(EXIT_FAILURE) end

status = EG_saveModel(emodel, "tire.egads");
printf("EG_saveModel -> status=%d\n", status);
if (status < 0) exit(EXIT_FAILURE) end

# cleanup
status = EG_deleteObject(emodel);
printf("EG_close -> status=%d\n", status);
