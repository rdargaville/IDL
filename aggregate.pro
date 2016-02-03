pro aggregate,xin,xout,yin,yout,group

npts = long(n_elements(xin))
nout = npts/group

xout = dblarr(nout)
yout = fltarr(nout)

for i=0L,nout-1 do BEGIN

    xout(i) = total(xin(i*group:i*group+group-1))/group
    yout(i) = total(yin(i*group:i*group+group-1))/group

endfor

end
