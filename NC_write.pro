pro NC_WRITE,filename,data,xs,ys,time,varname,xname,yname,timename

print,filename
ncid = NCDF_CREATE(filename,/CLOBBER)
xdimid = NCDF_DIMDEF(ncid,xname,n_elements(xs))
if (xdimid eq -1) then stop,'error'
ydimid = NCDF_DIMDEF(ncid,yname,n_elements(ys))
if (ydimid eq -1) then stop,'error'
timdimid = NCDF_DIMDEF(ncid,'years',n_elements(years))
if (timdimid eq -1) then stop,'error'

xid = NCDF_VARDEF(ncid,xname,xdimid)
yid = NCDF_VARDEF(ncid,yname,ydimid)
timid = NCDF_VARDEF(ncid,timename,timdimid)
dims = [xdimid,ydimid,timdimid]
print,'dims = ',dims
dataid = NCDF_VARDEF(ncid,varname,dims)

NCDF_control,ncid,/endef

NCDF_VARPUT,ncid,xid,xs
NCDF_VARPUT,ncid,yid,ys
NCDF_VARPUT,ncid,timid,time
print,'in WRITENC ',ncid,dataid
NCDF_VARPUT,ncid,dataid,data

NCDF_CLOSE, ncid

end
