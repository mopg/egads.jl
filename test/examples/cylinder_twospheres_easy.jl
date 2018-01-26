using jegads

width = 5.0
rad   = 1.0

(context, status) = eg_open( )
if (status < 0) error("Can't open, failure code: %i", status) end

# build cylinder
datacyl = [0.0, 0.0,  width/2.0,
           0.0, 0.0, -width/2.0,
           rad]
(ebody1, status) = makeSolidBody(context, CYLINDER, datacyl)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# build end points of sphere
datasph = [0.0, 0.0, -width/2.0, rad]
(ebody2, status) = makeSolidBody(context, SPHERE, datasph)
if (status != EGADS_SUCCESS) cleanup(status, context) end

datasph = [0.0, 0.0,  width/2.0, rad]
(ebody3, status) = makeSolidBody(context, SPHERE, datasph)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# boolean operations
(emodel2, status) = solidBoolean(ebody1, ebody2, FUSION)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# add second sphere
(ebody4, status) = getBodyFromModel( emodel2 )
if (status != EGADS_SUCCESS) cleanup(status, context) end
(emodel, status) = solidBoolean(ebody4, ebody3, FUSION)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# save model
status = EG_saveModel(emodel, "test.egads")
if (status != EGADS_SUCCESS) cleanup(status, context) end
status = EG_saveModel(emodel, "test.step")
if (status != EGADS_SUCCESS) cleanup(status, context) end

# delete
status = EG_deleteObject(ebody1)
if (status != EGADS_SUCCESS) cleanup(status, context) end
status = EG_deleteObject(ebody2)
if (status != EGADS_SUCCESS) cleanup(status, context) end
status = EG_deleteObject(ebody3)
if (status != EGADS_SUCCESS) cleanup(status, context) end
status = EG_deleteObject(ebody4)
if (status != EGADS_SUCCESS) cleanup(status, context) end
status = EG_deleteObject(emodel)
if (status != EGADS_SUCCESS) cleanup(status, context) end
status = EG_deleteObject(emodel2)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# close everything
cleanup( context )
