function cleanup( status::Cint, context::ego )
    warn("No success, status: %i", status )
    status = EG_close(context)
    @printf("EG_close -> status=%d\n", status);
end

function cleanup( context::ego )
    status = EG_close(context)
    @printf("EG_close -> status=%d\n", status);
end
