pro legend,position,levels,colors,legformat,charsize

nlevels = n_elements(levels)
levels2 = fltarr(nlevels+2)
levels2(1:nlevels) = levels
levels2(0) = levels(0) - (levels(1)-levels(0))
levels2(nlevels+1) = levels(nlevels-1) + (levels(1)-levels(0))

xticknames=strarr(nlevels+4)
xticknames(*) = ' '

ii = indgen(nlevels/2)*2
for i=0,nlevels do BEGIN
    if i mod 2 eq 1 then xticknames(i) = string(levels2(i+1),format=legformat)
    if i mod 2 eq 0 then xticknames(i) = ' '
endfor
   
plot,[0,0],[0,0],position=position,$
/nodata,yrange=[0,10],xrange=[levels2(0),levels2(nlevels+1)],$
xticklayout=1,yticklayout=1,/noerase,ytickname=[' ',' ',' ',' ',' ',' ',' '],$
xstyle=1,ystyle=1,xtickname=xticknames,xticks=nlevels+1,font=0,charthick=2,charsize=charsize

for ii = 0,nlevels-2 do BEGIN
polyfill,[levels2(ii+1),levels2(ii+2),levels2(ii+2),levels2(ii+1),levels2(ii+1)],[9,9,0,0,9],color=colors(ii+1)
endfor

polyfill,[levels2(0),levels2(1),levels2(1),levels2(0)],[5,9,0,5],color=colors(0)
polyfill,[levels2(nlevels),levels2(nlevels+1),levels2(nlevels),levels2(nlevels)],[9,5,0,9],color=colors(nlevels)

oplot,[levels2(1),levels2(nlevels)],[0,0]
oplot,[levels2(1),levels2(nlevels)],[9,9]
;for ii = 0,nlevels-1 do BEGIN
;    oplot,[levels(ii),levels(ii)],[0,9]
;endfor
oplot,[levels2(0),levels(0)],[5,9]
oplot,[levels2(0),levels(0)],[5,0]

oplot,[levels2(nlevels),levels2(nlevels+1)],[9,5]
oplot,[levels2(nlevels),levels2(nlevels+1)],[0,5]

return

end
