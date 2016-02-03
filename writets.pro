pro writets,filename,header,xs,ys

caldat,xs,month,day,year,hour,minute

openw,lun,filename,/get_lun

printf,lun,header

npts = n_elements(xs)

printf,lun,npts

if npts ne n_elements(ys) then stop

for i =0,npts-1 do BEGIN

    ;printf,lun,xs(i),ys(i),format='(f20.10,f10.3)'
    printf,lun,xs(i),year(i),month(i),day(i),hour(i),minute(i),ys(i),format='(f20.10,5i6,f10.3)'

endfor

free_lun,lun

end
