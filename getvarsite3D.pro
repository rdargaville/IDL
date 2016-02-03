pro getvarsite3D,varname,data,filename,ilon,ilat

dims = intarr(3)

ncid=NCDF_OPEN(filename,/NOWRITE)
fileinfo  = ncdf_inquire(ncid)
for i=0,fileinfo.nvars-1 do BEGIN
    varinfo=ncdf_varinq(ncid,i)
    print,'Variable ',i,' = ',varinfo.name
    if varinfo.name eq varname then BEGIN
       for idims = 0,varinfo.ndims-1 do BEGIN
            ncdf_diminq,ncid,idims,name,n_record
            dims(idims) = n_record
        endfor

       count = [1,1,dims(2)]
       offset = [ilon,ilat,0]

       ncdf_varget,ncid,i,data,count=count,offset=offset
       data = reform(data)
    endif
endfor

end

