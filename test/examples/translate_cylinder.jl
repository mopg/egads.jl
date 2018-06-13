using egads

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
datacyl = [0.0, 0.0, 2*width,
           0.0, 0.0, 3*width,
           rad]
(ebody2,status) = EG_makeSolidBody(context, CYLINDER, datacyl)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# Translate cylinder 2
Δx = [0.0,0.0,-width]
matrix = [ 1.0, 0.0, 0.0, Δx[1],
           0.0, 1.0, 0.0, Δx[2],
           0.0, 0.0, 1.0, Δx[3] ]

exform_ptr = Ref{ego}()
status = EG_makeTransform(context, matrix, exform_ptr)
if (status != egads.EGADS_SUCCESS) egads.cleanup(status, context) end
(ebody22,status) = EG_copyObject(ebody2, exform_ptr[])
# join
toler = Cdouble(0.0)
(emodel, status) = EG_join( ebody1, ebody22, toler )
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
status = EG_deleteObject(ebody22)
if (status != EGADS_SUCCESS) cleanup(status, context) end
status = EG_deleteObject(emodel)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# close everything
cleanup( context )
