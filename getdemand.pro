pro getdemand,dates,demand,price,states

filename = '/home/UNIMELB/rogerd/DEMAND/ALL_DEMAND.nc'

getvar,'date',dates,filename
getvar,'demand',demand,filename
getvar,'price',price,filename

states = ['NSW1','QLD1','SA1','TAS1','VIC1','SNOWY']

end
