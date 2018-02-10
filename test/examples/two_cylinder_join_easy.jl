using jegads

width = 5.0
rad   = 1.0

NULL_E = ego(0)

(context, status) = EG_open( )
if (status < 0) error("Can't open, failure code: %i", status) end

# build cylinder 1
datacyl = [0.0, 0.0,    0.0,
           0.0, 0.0,  width,
           rad]
(ebody1, status) = EG_makeSolidBody(context, CYLINDER, datacyl)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# build cylinder 2
datacyl = [0.0, 0.0, -width,
           0.0, 0.0, 0.0,
           rad]
(ebody2, status) = EG_makeSolidBody(context, CYLINDER, datacyl)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# join
toler = Cdouble(0.0)
(emodel, status) = EG_join( ebody1, ebody2, toler )
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
