FUNCTION GET_DATA3,maxrec=maxrec $
		 , file=file $
		 ,missing=missing $
		 ,quiet=quiet
t0 = systime(1)
;- Check arguments
if (n_elements(file) eq 0) then $
    file=dialog_pickfile(/read,/must_exist )
    
    
if (n_elements(maxrec) eq 0) then $
  maxrec = 100000L
if (n_elements(missing) eq 0) then $
  missing = -99.9

if not keyword_set(quiet) then begin
   print,'getting data from ' + file + ' with'
   print,'   - maxrec set to'+ strcompress(maxrec) + ' and'
   print,'   - missing value set to' + strcompress(missing)
   print,'NOTE: missing values are converted to IEEE NaN.
endif

;- Open input file
if not(keyword_set(quiet)) then print,'Reading...'
openr, lun, file , /get_lun
;- read header line

cell = {datum, year:0, month:0, day:0, maxtemp:0.0, mintemp:0.0}
data = replicate({datum}, maxrec)


;- Read records until end-of-file reached
recnum = 0L
fmt = '(a14,2x,i4,1x,i4)'
station_date_read = ''
while (eof(lun) ne 1) do begin

  ;- Read this record (jumps to bad_rec: on error)
  on_ioerror, bad_rec
  error = 1
  readf, lun, station_date_read $
            , maxtemp_read      $
	    , mintemp_read      $
	    ,format = fmt

  error = 0

; convert station_date_read to station number and date
  station_num = strmid(station_date_read,0,6)
  year_read = fix(strmid(station_date_read,6,4))
  month_read = fix(strmid(station_date_read,10,2))
  day_read = fix(strmid(station_date_read,12,2))

  ;- Store data for this record
  data[recnum].maxtemp = float(maxtemp_read)/10.0
  data[recnum].mintemp = float(mintemp_read)/10.0
  data[recnum].year = year_read
  data[recnum].month = month_read
  data[recnum].day = day_read

  recnum = recnum + 1L

;- Check if maximum record count exceeded
  if (recnum eq maxrec) then begin
    free_lun, lun
    message, 'Maximum record reached: increase MAXREC'
  endif

  ;- Check for bad input record
  bad_rec:
  if (error eq 1) then $
    print, 'Bad data at record ', recnum

endwhile

;- Close input file
free_lun, lun
if not(keyword_set(quiet)) then print,'...Finished!'

;- Trim data array
data = data[0 : recnum - 1]
;- convert missing data to NaN
totalcount=0

ind=where(data.maxtemp eq missing,count)
if count ne 0 then data[ind].maxtemp = !values.f_nan
totalcount=totalcount+count

ind=where(data.mintemp eq missing,count)
if count ne 0 then data[ind].mintemp = !values.f_nan
totalcount=totalcount+count


if not(keyword_set(quiet)) then print,'a total of'+strcompress(totalcount)+' missing values were found and converted to NaN.'

;-package data and return to caller
if not(keyword_set(quiet)) then print,' total time taken:',strcompress(systime(1) - t0),' seconds'
return,data
END
