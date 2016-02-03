pro getattr2,varname,attname,values,filename

verbose = 1
found = 0
;inquire as to the contents
ncid=NCDF_OPEN(filename,/NOWRITE)
fileinfo = ncdf_inquire(ncid)
if verbose then print,'Number of variables:   ',fileinfo.nvars

;loop over the number of variables, get more info
for i=0,fileinfo.nvars-1 do BEGIN
    varinfo=ncdf_varinq(ncid,i)
    if verbose then print,'Variable ',i,' = ',varinfo.name

    ; if the variable is the main one we want
    if varinfo.name eq varname then BEGIN
         found = 1
         if verbose then BEGIN
         print,'=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
         print,'Found the variable'
         print,'=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
         print,'Variable ',i,' = ',varinfo.name
         print,'    Datatype =  ',varinfo.datatype
         print,'    Ndims =  ',varinfo.ndims
         print,'    Natts =  ',varinfo.natts
         print,'    Dim =  ',varinfo.dim
         endif
         ; print out the attributes

         for idims = 0,varinfo.ndims-1 do BEGIN
            ncdf_diminq,ncid,idims,name,n_records
            if verbose then print,'Record length = ',n_records
         endfor
         ncdf_varget,ncid,i,data
         if varinfo.datatype eq 'CHAR' then data = string(data)
         if verbose then print,'RECDIM = ',fileinfo.recdim

         offset = 0
         factor = 1.0

         for iatts=0,varinfo.natts-1 do BEGIN
             name=ncdf_attname(ncid,i,iatts)
             ncdf_attget,ncid,i,name,result
             if verbose then print,'    ',name,'  ',string(result)
             if name eq attname then BEGIN
                 values = float(result)
                 if verbose then print,'have set result to be ',values
             endif 

         endfor
         if verbose then print,values

         ;print,offset,factor

         if varinfo.datatype ne 'CHAR' then data = data * factor + offset
    endif

endfor

if found eq 0 then BEGIN
    print,'Did not find variable ', varname
    print,'Choices are:'
    for i=0,fileinfo.nvars-1 do BEGIN
        varinfo=ncdf_varinq(ncid,i)
        print,'Variable ',i,' = ',varinfo.name
    endfor
    ncdf_close,ncid
   
   stop
endif

ncdf_close,ncid
end
