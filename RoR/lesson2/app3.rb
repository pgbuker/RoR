arr = [0,1]
arr.each do 
  result = arr[-1] + arr[-2] 
  if  result <= 100
  arr.push(result)
  end 
end
print arr
