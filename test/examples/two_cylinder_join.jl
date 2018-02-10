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

# find faces
nface1_ptr = Ref{Cint}(0)
faces1_ptr = Ref{Ptr{ego}}()
jegads.EG_getBodyTopos(ebody1, NULL_E, FACE, nface1_ptr, faces1_ptr)
nface1 = nface1_ptr[]

# build cylinder 2
datacyl = [0.0, 0.0, -width,
           0.0, 0.0, 0.0,
           rad]
(ebody2, status) = EG_makeSolidBody(context, CYLINDER, datacyl)
if (status != EGADS_SUCCESS) cleanup(status, context) end

# find faces
nface2_ptr = Ref{Cint}(0)
faces2_ptr = Ref{Ptr{ego}}()
jegads.EG_getBodyTopos(ebody2, NULL_E, FACE, nface2_ptr, faces2_ptr)
nface2 = nface2_ptr[]

# match faces
nmatch_ptr = Ref{Cint}(0)
match_ptr  = Ref{Ptr{Cint}}()
toler = Cdouble(0.0)
EG_matchBodyFaces(ebody1, ebody2, toler, nmatch_ptr, match_ptr)
nmatch = nmatch_ptr[]
matches = fill( 0, 2*nmatch )
for ii in 1:nmatch
    matches[2*ii-1] = unsafe_load(match_ptr[],2*ii-1)
    matches[2*ii]   = unsafe_load(match_ptr[],2*ii)
end

# delete all matching faces
efaces = Vector{ ego }( nface1 + nface2 )
jj = 1
for ii in 1:nface1
    efaces[jj] = unsafe_load(faces1_ptr[],ii); jj += 1
    for kk in 1:nmatch
        if (ii == matches[2*kk-1])
            jj -= 1
        end
    end
end
for ii in 1:nface2
    efaces[jj] = unsafe_load(faces2_ptr[],ii); jj += 1
    for kk in 1:nmatch
        if (ii == matches[2*kk])
            jj -= 1
        end
    end
end
jj -= 1

# sew faces
toler = 0.0
(emodel, result) = EG_sewFaces( Cint(jj), efaces, toler, Cint(0) )
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
