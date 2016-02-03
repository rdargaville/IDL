FUNCTION READ_NETCDF, file=file, attributes=attributes, quiet=quiet

;This function reads and returns variables (and their attributes) of a netcdf file 
;
;Result=read_netcdf(file=file)
;
;Result, returns a structure containing all variables in the netcdf file under 
;generic variable names
;
;KEYWORDS 
;        file - the input netcdf file
;  attributes - if set, will return attributes as well as variables
;
;Created by Ailie Gallant
;22/5/2008
;-----------------------------------------------------------
;-----------------------------------------------------------

if not(keyword_set(attributes)) and not(keyword_set(quiet)) then $
  print,"Attributes keyword not set! Only variables will be returned!"

;If a file to open is not specified then open a dialogue box
if (n_elements(file) eq 0) then file=dialog_pickfile(/read,/must_exist)

;Open the netcdf file
cdfid=ncdf_open(file,/nowrite)

;Perform an inquiry on the file to determine aspects of the file
inq=ncdf_inquire(cdfid)

;Define file aspects
ndims=inq.ndims		;number of dimensions
nvars=inq.nvars		;number of variables
ngatts=inq.ngatts	;number of attributes
recdim=inq.recdim	;record dimension

;Find the names of the variables
names=ncdf_vardir(cdfid)

;Create a structure containing the first variable
ncdf_varget, cdfid, names[0], var  ;get the variable
str=create_struct(names[0],var)    ;assign to a structure

if keyword_set(attributes) then begin
;Find any attributes associated with the first variable
attnames=ncdf_attdir(cdfid,names[0])
for i=0,n_elements(attnames)-1 do begin
   ncdf_attget,cdfid,names[0],attnames[i], att
   type=size(att,/type)                     ;test the type of array
   if type eq 1 then att=string(att)        ;change byte arrays to strings
   tag=names[0]+'_'+attnames[i]
   str=create_struct(str,tag,att)			;add attribute to the structure
endfor
endif

;Begin a loop to get other variables and put them into the structure
for i=1, nvars-1 do begin

   ncdf_varget, cdfid, names[i], var  			;get variable i
   str=create_struct(str,names[i],var)			;add new variable to the structure
 
 if keyword_set(attributes) then begin
   attnames=ncdf_attdir(cdfid,names[i])         ;find attributes associated with variable i
      
      for j=0,n_elements(attnames)-1 do begin
           ncdf_attget,cdfid,names[i],attnames[j], att
              type=size(att,/type)                     ;test the type of array
              if type eq 1 then att=string(att)        ;change byte arrays to strings
           tag=names[i]+'_'+attnames[j]
           str=create_struct(str,tag,att)			;add attribute to the structure
       endfor
  endif
endfor

ncdf_close, cdfid

return, str   ;return the structure
end