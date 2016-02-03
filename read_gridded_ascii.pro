PRO read_gridded_ascii, ascii, lon, lat, file=file

;This FUNCTION will read gridded ascii data files and transform them into an array for use in IDL
;
;INPUT: filename
;
;OUTPUT: array of gridded ascii data
;
;Created by Ailie Gallant 14/06/2006


;All gridded ascii files should contain a six line header at the beginning of the file with the following information:
;
;ncols         number of columns
;nrows         number of rows
;xllcorner     longitudinal (x) value of the grid point in the lower left corner
;yllcorner     latitudinal (y) value of the grid point in the lower left corner
;cellsize      size of the grid box in degrees
;NODATA_value  number assigned to missing data values

;Read the header file

if (not keyword_set(file)) then file=dialog_pickfile(/read,/must_exist)

openr, lun, file, /get_lun
header = fltarr(6)
readf, lun, header, format='(14x, f7.3)'

ncols = fix(header[0])
nrows = fix(header[1])
xllcorner = header[2]
yllcorner = header[3]
cellsize = header[4]
nodata_value = header[5]

lat=reverse(findgen(nrows)*cellsize+yllcorner)
lon=findgen(ncols)*cellsize+xllcorner

ascii = fltarr(ncols,nrows)

readf, lun, ascii
free_lun, lun

end