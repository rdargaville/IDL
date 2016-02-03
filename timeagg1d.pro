pro timeagg1d,datain,dataout,timein,timeout,timename,auto

timeunits = [1/48.,1/24.,3/24,6/24.,1,7,30,365]
timenames = ['half_hourly','hours','3hourly','6hourly','days','weeks','months','years']

nsteps = n_elements(timein)
caldat,timein(0),a,b,c
;print,'START TIME = ',a,b,c
caldat,timein(nsteps-1),a,b,c
;print,'END TIME = ',a,b,c


ninc = nsteps/30  ; i.e. try to keep the number of steps to no more than 50
steplen=timein(ninc)-timein(0)

temp = (timeunits-steplen)^2
ideal = where(temp eq min(temp))
ideal = ideal(0)
if auto then  timename = timenames(ideal) else BEGIN
    ideal = where(timenames eq  timename)
    ideal = ideal(0)
endelse
;print,timenames(ideal)

; number of steps per time increments
;print,timeunits(ideal)
nstepsnew = long((timein(nsteps-1)-timein(0))/timeunits(ideal))
nstepsnew = nstepsnew(0)

x = size(datain,/N_DIMENSIONS)
if x eq 2 then stop ; use 2d timeagg

timeout = dindgen(nstepsnew) * timeunits(ideal) + timein(0) + timeunits(ideal)/2.
dataout = fltarr(nstepsnew)

;print,'Doing ',nstepsnew,' loops'

for id = 0,nstepsnew-1 do BEGIN
    ;print,id
    istart = timein(0)+id*timeunits(ideal)
    iend = istart +timeunits(ideal)
    ii = where(timein ge istart(0) and timein lt iend(0),nii)
    if nii eq 0 then dataout(id) = -9999.9 else BEGIN
    dataout(id) = total(datain(ii))/nii
    ;print,dataout(id)
    endelse
endfor

caldat,timeout(0),a,b,c
;print,'START TIME = ',a,b,c
caldat,timeout(nstepsnew-1),a,b,c
;print,'END TIME = ',a,b,c

end


