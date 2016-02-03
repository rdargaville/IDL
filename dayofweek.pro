pro dayofweek,state,time,DOW

; calculate DOW for all dates 1998 to end of 2016
; then return DOW for dates in 'time'

dow_index = ['D','D','E','E','D','D','D']

starttime = julday(1,1,1998,1)
endtime = julday(12,31,2016,23)

ntime = long((endtime-starttime) * 48L)
alltimes = dindgen(ntime) * 1/48. + starttime


caldat,alltimes,month,day,year,hour,minute
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

; easter dates.  From Good Friday to Easter Monday 
ii = where (year eq 1998 and month eq 4 and day gt 9 and day lt 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 1999 and month eq 4 and day gt 1 and day lt 6,nii)
if nii gt 0 then dow(ii) = 'E'
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

ii = where (year eq 2014 and month eq 4 and day gt 17 and day lt 22,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2015 and month eq 4 and day gt 2 and day lt 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where (year eq 2016 and month eq 3 and day gt 24 and day lt 29,nii)
if nii gt 0 then dow(ii) = 'E'

; ANZAC day
ii = where(month eq 4 and day eq 25)
if nii gt 0 then dow(ii) = 'E'

; Queens birthday
ii = where(year eq 1998 and month eq 6 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 6 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
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
ii = where(year eq 2014 and month eq 6 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 6 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 6 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'

; labour day
if state eq 'VIC'  or state eq 'VIC1' then BEGIN
ii = where(year eq 1998 and month eq 3 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 3 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
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
ii = where(year eq 2014 and month eq 3 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 3 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 3 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
endif

if state eq 'TAS' or state eq 'TAS1' then BEGIN
ii = where(year eq 1998 and month eq 3 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 3 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2000 and month eq 3 and day eq 6,nii)
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
ii = where(year eq 2014 and month eq 3 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 3 and day eq 09,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 3 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
endif


if state eq 'NSW' or state eq 'SA' or state eq 'NSW1' or state eq 'SA1' then BEGIN
ii = where(year eq 1998 and month eq 10 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 10 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
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
ii = where(year eq 2014 and month eq 10 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 10 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 10 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
endif

if state eq 'QLD' or state eq 'QLD1' then BEGIN
ii = where(year eq 1998 and month eq 5 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 5 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
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
ii = where(year eq 2014 and month eq 10 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 10 and day eq 5,nii) 
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 10 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
endif

; Melbourne Cup
if state eq 'VIC'  or state eq 'VIC1' then BEGIN
ii = where(year eq 1998 and month eq 11 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 11 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
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
ii = where(year eq 2014 and month eq 11 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 11 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 11 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
endif

; Tasmania Recreation Day
if state eq 'TAS' or state eq 'TAS1' then BEGIN
ii = where(year eq 1998 and month eq 11 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 11 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2000 and month eq 11 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 11 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 11 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 11 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 11 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 11 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 11 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 11 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 11 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 11 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 11 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 11 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 11 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 11 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2014 and month eq 11 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 11 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 11 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
endif

; Australia Day
ii = where(month eq 1 and day eq 26,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(month eq 1 and day eq 28 and year eq 2008,nii)
if nii gt 0 then dow(ii) = 'E'

; Hobart regatta day
if state eq 'TAS' or state eq 'TAS1' then BEGIN
ii = where(year eq 2000 and month eq 2 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 2 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 2 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 2 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 2 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 2 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 2 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 2 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 2 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 2 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 2 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 2 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 2 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 2 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2014 and month eq 2 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 2 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 2 and day eq 8,nii)
if nii gt 0 then dow(ii) = 'E'
endif

; Adelaide cup
if state eq 'SA' or state eq 'SA1' then BEGIN
ii = where(year eq 1998 and month eq 5 and day eq 18,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 5 and day eq 17,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2000 and month eq 5 and day eq 15,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 5 and day eq 21,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 5 and day eq 20,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 5 and day eq 19,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 5 and day eq 17,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 5 and day eq 16,nii)
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
ii = where(year eq 2014 and month eq 3 and day eq 10,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 3 and day eq 9,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 3 and day eq 16,nii)
if nii gt 0 then dow(ii) = 'E'
endif

; NSW bank holiday
if state eq 'NSW' or state eq 'NSW1' then BEGIN
ii = where(year eq 1998 and month eq 8 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 8 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2000 and month eq 8 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 8 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 8 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 8 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 8 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 8 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 8 and day eq 7,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 8 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 8 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 8 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 8 and day eq 2,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 8 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 8 and day eq 6,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 8 and day eq 5,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2014 and month eq 8 and day eq 4,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 8 and day eq 3,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 8 and day eq 1,nii)
if nii gt 0 then dow(ii) = 'E'
endif

; Queensland Show day
if state eq 'QLD' or state eq 'QLD1' then BEGIN
ii = where(year eq 1998 and month eq 8 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 1999 and month eq 8 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2000 and month eq 8 and day eq 16,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2001 and month eq 8 and day eq 15,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2002 and month eq 8 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2003 and month eq 8 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2004 and month eq 8 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2005 and month eq 8 and day eq 17,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2006 and month eq 8 and day eq 16,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2007 and month eq 8 and day eq 15,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2008 and month eq 8 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2009 and month eq 8 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2010 and month eq 8 and day eq 11,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2011 and month eq 8 and day eq 17,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2012 and month eq 8 and day eq 15,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2013 and month eq 8 and day eq 14,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2014 and month eq 8 and day eq 13,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2015 and month eq 8 and day eq 12,nii)
if nii gt 0 then dow(ii) = 'E'
ii = where(year eq 2016 and month eq 8 and day eq 17,nii)
if nii gt 0 then dow(ii) = 'E'
endif


; now trim the full array to match the input dates
a = min([max(alltimes),max(time)])
b = max([min(alltimes),min(time)])

kk = where(alltimes ge b and alltimes le a)

DOW = DOW(kk)


end
