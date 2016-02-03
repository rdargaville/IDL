;pro ncdump,filename  ; does what ncdump does
pro ncdump,filename  ; does what ncdump does

;filename = 'wrfout_d04_2009-09-03_00:00:00.nc'

ncid=NCDF_OPEN(filename,/NOWRITE)
fileinfo = ncdf_inquire(ncid)

print,'File: ',filename,' dims: ', fileinfo.ndims,' Vars:',fileinfo.nvars

for i = 0,fileinfo.nvars-1 do BEGIN

    varinfo = ncdf_varinq(ncid,i)
    ndims = varinfo.ndims
    natts = varinfo.natts

    ;print,'natts = ',natts

    for jj = 0,natts-1 do BEGIN
        attname=ncdf_attdir(ncid,varinfo.name,jj)
        print,'Attibute: ',attname
    endfor
    
    if ndims eq 1 then getvar,varinfo.name,data,filename
    if ndims gt 1 then print,varinfo.name
    for j = 0,ndims-1 do BEGIN
        ; write the dimensions
        ncdf_diminq,ncid,varinfo.dim(j),name,isize
        if ndims eq 1 then $
        print,name,isize,' values from ',data(0),' to ',data(isize-1)
        if ndims gt 1 then $
        print,'          ',name,isize
    endfor

endfor

ncdf_close,ncid

stop

end



