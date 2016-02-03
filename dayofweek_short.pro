pro dayofweek,startyear,state,timein,DOW_out

DOW_out = strarr(n_elements(timein))

if startyear eq 2000 then dow_index = ['E','E','D','D','D','D','D']
if startyear eq 2001 then dow_index = ['D','D','D','D','D','E','E']
if startyear eq 2002 then dow_index = ['D','D','D','D','E','E','D']
if startyear eq 2003 then dow_index = ['D','D','D','E','E','D','D']
if startyear eq 2004 then dow_index = ['D','D','E','E','D','D','D']
if startyear eq 2005 then dow_index = ['E','E','D','D','D','D','D']
if startyear eq 2006 then dow_index = ['E','D','D','D','D','D','E']
if startyear eq 2007 then dow_index = ['D','D','D','D','D','E','E']
if startyear eq 2008 then dow_index = ['D','D','D','D','E','E','D']
if startyear eq 2009 then dow_index = ['D','D','E','E','D','D','D']
if startyear eq 2010 then dow_index = ['D','E','E','D','D','D','D']
if startyear eq 2011 then dow_index = ['E','E','D','D','D','D','D']
if startyear eq 2012 then dow_index = ['E','D','D','D','D','D','E']
if startyear eq 2013 then dow_index = ['D','D','D','D','E','E','D']

time = dindgen(365*48)/48. + julday(1,1,startyear)

caldat,time,month,day,year,hour,minute

ntime = n_elements(time)
ndays = ntime/48
DOW = strarr(ntime)
d = 0
icount = 0L
for ix = 0L,ndays-1 do BEGIN
    ;print,d,dow_index(d)
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
if nii gt 0 then dow(ii) = 'E'
ii = where (month eq 1 and day lt 5,nii)
if nii gt 0 then dow(ii) = 'E'

; easter dates 2006 - April 16, 2007 - April 8, 2008 - March 23
ii = where (year eq 2000 and month eq 4 and day gt 20 and day lt 25,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2001 and month eq 4 and day gt 12 and day lt 17,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2002 and month eq 3 and day gt 28,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2002 and month eq 4 and day lt 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2003 and month eq 4 and day gt 17 and day lt 22,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2004 and month eq 4 and day gt 8 and day lt 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2005 and month eq 3 and day gt 24 and day lt 29,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2006 and month eq 4 and day gt 13 and day lt 19,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2007 and month eq 4 and day gt 5 and day lt 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2008 and month eq 3 and day gt 20 and day lt 25,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2009 and month eq 4 and day gt 9 and day lt 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2010 and month eq 4 and day gt 1 and day lt 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2011 and month eq 4 and day gt 21 and day lt 26, nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2012 and month eq 4 and day gt 5 and day lt 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2013 and month eq 3 and day gt 28,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2013 and month eq 4 and day lt 2,nii)
if nii gt 0 then dow(ii) = 'E'

; ANZAC day
ii = where(month eq 4 and day eq 25)
if nii gt 0 then dow(ii) = 'E'

; Queens birthday
ii = where(year eq 2000 and month eq 6 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 6 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 6 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 6 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 6 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 6 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 6 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 6 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 6 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 6 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 6 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 6 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 6 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 6 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'

; labour day
if state eq 'VIC' then BEGIN
ii = where(year eq 2000 and month eq 3 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 3 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 3 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 3 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 3 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 3 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 3 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 3 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 3 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 3 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 3 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 3 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 3 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 3 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
endif

if state eq 'NSW' or state eq 'SA' then BEGIN
ii = where(year eq 2000 and month eq 10 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 10 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 10 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 10 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 10 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 10 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 10 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 10 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 10 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 10 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 10 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 10 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 10 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 10 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
endif

if state eq 'QLD' then BEGIN
ii = where(year eq 2000 and month eq 5 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 5 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 5 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 5 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 5 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 5 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 5 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 5 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 5 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 5 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 5 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 5 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 5 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 10 and day eq 7,nii)  ; looks like QLD changed to October this year
if nii gt 0 then dow(ii) = 'E'
endif

; Melbourne Cup
if state eq 'VIC' then BEGIN
ii = where(year eq 2000 and month eq 11 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 11 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 11 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 11 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 11 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 11 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 11 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 11 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 11 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 11 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 11 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 11 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 11 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 11 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
endif

; Australia Day
ii = where(month eq 1 and day eq 26,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(month eq 1 and day eq 28 and year eq 2008,nii)
if nii gt 0 then dow(ii) = 'E'

; put the times onto the input times
stop
if 1 then BEGIN
    DOW_out = DOW
endif else BEGIN
print,'puting timein onto times'
for ix = 0L,n_elements(timein)-1 do BEGIN
   diff = abs(time - timein(ix))
   kk = where(diff eq min(diff),nii)
   if nii  ne 1 then stop
   DOW_out(ix) = DOW(reform(kk))
endfor
endelse

;stop

end

