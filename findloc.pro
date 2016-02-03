pro findloc,lons,lats,ilon,ilat,ifind,jfind,iloc

print,'start of findloc lon,lat = ',ilon,ilat

ndims_lons = size(lons)
ndims_lats = size(lats)

if ndims_lons(0) eq 1 then BEGIN ; create 2d versions of lons and lats

    lons2 = fltarr(ndims_lons(1),ndims_lats(1))
    lats2 = fltarr(ndims_lons(1),ndims_lats(1))

    for i = 0,ndims_lons(1) do lons2(i,*) = lons
    for i = 0,ndims_lats(1) do lats2(*,i) = lats

    lons = lons2
    lats = lats2
endif

nlons = n_elements(lons(*,0))
nlats = n_elements(lons(0,*))

jspot =  sqrt((lats - ilat)*(lats-ilat))
kspot =  sqrt((lons - ilon)*(lons-ilon))
ispot = kspot + jspot

levs = findgen(40)/10
;contour,ispot,lons,lats,/fill,levels=levs

iloc = where(ispot eq min(ispot))
jfind = iloc / nlons
ifind = iloc - nlons*jfind

print,'check lons ',lons(iloc),lons(ifind,jfind)
print,'check lats ',lats(iloc),lats(ifind,jfind)

end
