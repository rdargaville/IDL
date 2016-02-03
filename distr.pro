pro distr,input,ranges,output

nrange = n_elements(ranges)
output = lonarr(nrange)

for i = 0,nrange-2 do BEGIN
    mm = where(input ge ranges(i) and input lt ranges(i+1),nmm)
    output(i) = nmm
endfor

mm = where(input ge ranges(nrange-1),nmm)
output(nrange-1) = nmm

end
