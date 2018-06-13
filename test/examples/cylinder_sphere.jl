using egads

# const libegads_include = "/home/mopg/code/EngSketchPad/lib/libegads.so"
# include the above in the precompilation step. use libdl.find_library to look for common places where this library file is located

egO   = Ref{ego}() # Pointer to a pointer essentially
egO_2 = Ref{ego}()
egO_3 = Ref{ego}()
egO_4 = Ref{ego}()

# the other way to do this is in the function
# function blabla(cid)
#            ptrobj = Ref{ego}()
#            call c function bullshit
#            return ptrobj[]
# end

# if you want to initialize a pointer to an object, you need to use for example
#       bla = ego( 0 ) # initialize to something

width = 5.0
rad   = 1.0

status = EG_open(egO)
if (status < 0) error("Can't open, failure code: %i", status) end
context = egO[] # now dereference the pointer to obtain the
@show context

# build cylinder
datacyl = [0.0, 0.0,  width/2.0,
           0.0, 0.0, -width/2.0,
           rad]
status = EG_makeSolidBody(context, CYLINDER, datacyl, egO_2)
ebody1 = egO_2[] # dereference the pointer to obtain the pointer to egObject
if (status != EGADS_SUCCESS) cleanup(status, context) end

# build end points of sphere
datasph = [0.0, 0.0, -width/2.0, rad]
status = EG_makeSolidBody(context, SPHERE, datasph, egO_3)
ebody2 = egO_3[] # dereference the pointer to obtain the pointer to egObject
if (status != EGADS_SUCCESS) cleanup(status, context) end

# boolean operations
status = EG_solidBoolean(ebody1, ebody2, FUSION, egO_4)
emodel = egO_4[]
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
