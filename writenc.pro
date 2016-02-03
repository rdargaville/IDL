pro writenc,filename,varname,xname,yname,zname,data,xs,ys,zs

print,filename
ncid = NCDF_CREATE(filename,/CLOBBER)
xdimid = NCDF_DIMDEF(ncid,xname,n_elements(xs))
if (xdimid eq -1) then stop,'error'
ydimid = NCDF_DIMDEF(ncid,yname,n_elements(ys))
if (ydimid eq -1) then stop,'error'
zdimid = NCDF_DIMDEF(ncid,zname,n_elements(zs))
if (zdimid eq -1) then stop,'error'

xid = NCDF_VARDEF(ncid,xname,xdimid)
yid = NCDF_VARDEF(ncid,yname,ydimid)
zid = NCDF_VARDEF(ncid,zname,zdimid)
dims = [xdimid,ydimid,zdimid]
print,'dims = ',dims
dataid = NCDF_VARDEF(ncid,varname,dims)

NCDF_control,ncid,/endef

NCDF_VARPUT,ncid,xid,xs
NCDF_VARPUT,ncid,yid,ys
NCDF_VARPUT,ncid,zid,zs
print,'in WRITENC ',ncid,dataid
NCDF_VARPUT,ncid,dataid,data

NCDF_CLOSE, ncid

end
