pro dayofweek,startdate,enddate,state,time,DOW

; reads in the start time and end time, and returns the days of the week 
;  (with mod for public holidays etc

; calculate for period 2000 to 2016

allstart = julday(1,1,2000)
allend = julday(12,31,2016)

ndays = 48L*(allend-allstart+1)

time = dindgen(ndays)/48.+allstart
alldays = strarr(ndays)

dow_index = [2,2,1,1,1,1,1]

caldat,time,month,day,year,hour,minute 
ntime = n_elements(time)
ndays = ntime/48
DOW = intarr(ntime)
d = 0
icount = 0L
for ix = 0L,ndays-1 do BEGIN
    for iy  = 0,47 do BEGIN
        DOW(icount) = dow_index(d)
        icount = icount + 1
    endfor
    d = d + 1
    if d eq 7 then d = 0
endfor

; fix the days of the week
; Christmas
ii = where (month eq 12 and day gt 23,nii)
if nii gt 0 then dow(ii) = 2
ii = where (month eq 1 and day lt 5,nii)
if nii gt 0 then dow(ii) = 2

; Australia Day
ii = where(month eq 1 and day eq 26,nii)
if nii gt 0 then dow(ii) = 2
ii = where(month eq 1 and day eq 28 and year eq 2008,nii)
if nii gt 0 then dow(ii) = 2

; ANZAC day
ii = where(month eq 4 and day eq 25)
if nii gt 0 then dow(ii) = 2

easter = [julday(2000,4,23),julday(2001,4,15),julday(2002,3,31),$
    julday(2003,4,20),julday(2004,4,11),julday(2005,3,27),$
    julday(2006,4,16),julday(2007,4,8),julday(2008,3,23),$
    julday(2009,4,12),julday(2010,4,4),julday(2011,4,24),$
    julday(2012,4,8),julday(2013,3,31),julday(2014,4,20),$
    julday(2015,4,5),julday(2016,3,27)]

; easter dates
for i = n_elements(easter)-1 do BEGIN
    kk = where(time gt easter(i)-3 and time lt easter(i)+2)
    dow(kk) = 2
endfor
endif

; Queens birthday: second Monday in June
qb = [julday(6,12,2000),julday(6,11,2001),julday(6,10,2002),$
    julday(6,9,2003),julday(6,14,2004),julday(6,13,2005),$
    julday(6,12,2006),julday(6,11,2007),julday(6,9,2008),$
    julday(6,8,2009),julday(6,14,2010),julday(6,13,2011),$
    julday(6,11,2012),julday(6,10,2013),julday(6,9,2014),$
    julday(6,8,2015),julday(6,14,2016)]
for i = n_elements(qb)-1 do BEGIN
    kk = where(time gt qb(i) and time lt qb(i)+1)
    dow(kk) = 2
endfor
endif

; labour day 
if state eq 'VIC' or state eq 'TAS'  then BEGIN ; first Monday in June
labour = [julday(3,13,2000),julday(3,12,2001),julday(3,11,2002),$
    julday(3,10,2003),julday(3,9,2004),julday(3,14,2005),$
    julday(3,12,2006),julday(3,12,2007),julday(3,10,2008),$
    julday(3,9,2009),julday(3,8,2010),julday(3,14,2011),$
    julday(3,12,2012),julday(3,11,2013),julday(3,10,2014),$
    julday(3,9,2015),julday(3,8,2016)]
for i = n_elements(labour)-1 do BEGIN
    kk = where(time gt labour(i) and time lt labour(i)+1)
    dow(kk) = 2
endfor
endif
 
if state eq 'NSW' or state eq 'SA' then BEGIN ; First Monday in October
labour = julday(10,2,2000),julday(10,1,2001),julday(10,7,2002),$
julday(10,6,2003),julday(10,4,2004),julday(10,3,2005),$
julday(10,2,2006),julday(10,1,2007),julday(10,6,2008),$
julday(10,5,2009),julday(10,4,2010),julday(10,3,2011),$
julday(10,1,2012),julday(10,7,2013),julday(10,6,2014),$
julday(10,5,2015),julday(10,7,2016)]

for i = n_elements(labour)-1 do BEGIN
    kk = where(time gt labour(i) and time lt labour(i)+1)
    dow(kk) = 2
endfor
endif

if state eq 'QLD' then BEGIN ; first Monday in May until 2013, then first in October
labour = [julday(5,1,2000),julday(5,7,2001),julday(5,6,2002),$
julday(5,5,2003),julday(5,3,2004),julday(5,2,2005),$
julday(5,1,2006),julday(5,7,2007),julday(5,5,2008),$
julday(5,4,2009),julday(5,3,2010),julday(5,2,2011),$
julday(5,7,2012),julday(10,7,2013),julday(10,6,2014),$
julday(10,5,2015),julday(10,3,2016)]

for i = n_elements(labour)-1 do BEGIN
    kk = where(time gt labour(i) and time lt labour(i)+1)
    dow(kk) = 2
endfor
endif

; Melbourne Cup
if state eq 'VIC' then BEGIN
mc = [julday(11,7,2000),julday(11,6,2001,julday(11,5,2002,$
julday(11,4,2003),julday(11,2,2004),julday(11,1,2005),$
julday(11,7,2006),julday(11,6,2007),julday(11,4,2008),$
julday(11,3,2009),julday(11,2,2010),julday(11,1,2011),$
julday(11,6,2012),julday(11,5,2013),julday(11,4,2014),$
julday(11,3,2015),julday(11,1,2016)] 

for i = n_elements(mc)-1 do BEGIN
    kk = where(time gt mc(i) and time lt mc(i)+1)
    dow(kk) = 2
endfor
endif


end

