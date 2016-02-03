pro runningmean,xin,yin,xout,yout,nsteps

nin = n_elements(xin)

if n_elements(yin) ne nin then stop

nout = nin - nsteps + 1

xout = fltarr(nout)
yout = fltarr(nout)

for i = 0L,nout-1 do begin

    istart = i
    iend = i+nsteps-1

    xout(i) = total(xin(istart:iend))/nsteps

    temp = yin(istart:iend)

    ; test for good (i.e. not NAN values)
    igood = where(finite(temp) eq 1,iigood)

    if iigood le nsteps/3*2 then yout(i) = !VALUES.F_NAN 
    if iigood gt nsteps/3*2 then yout(i) = total(temp(igood))/iigood

endfor

end
