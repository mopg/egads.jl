using egads

width = 5.0
rad   = 1.0

(context, status) = EG_open( )
if (status < 0) error("Can't open, failure code: %i", status) end

# build cylinder
datacyl = [0.0, 0.0,  width/2.0,
           0.0, 0.0, -width/2.0,
           rad]
(ebody1, status) = EG_makeSolidBody(context, CYLINDER, datacyl)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# build end points of sphere
datasph = [0.0, 0.0, -width/2.0, rad]
(ebody2, status) = EG_makeSolidBody(context, SPHERE, datasph)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# boolean operations
(emodel, status) = EG_solidBoolean(ebody1, ebody2, FUSION)
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
status = EG_deleteObject(emodel)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# close everything
cleanup( context )
