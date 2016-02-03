pro getweather,filename,AWS_names,AWS_dates,Temperature,Humidity

getvar,'Station_Names',AWS_names,filename
getvar,'time',AWS_dates,filename
getvar,'Temperature',temperature,filename
getvar,'Humidity',humidity,filename

end
