def minefield(center)
  if (center[0] < 1 || center[0] > 9) || (center[1] < 1 || center[1] > 9)
 	puts 'ERROR: center value wrong'
	sleep(5)
	exit(0)
  end
  ary = []
  i = 0
  j = 0
  while i < 3
	while j < 3
	  x = center[0] - 1 + i
	  y = center[1] - 1 + j
	  if (x >= 1 && x <= 9) && (y >= 1 || y <= 9)
	  	ary.push([x, y])
	  end
	  j += 1
	end
	i += 1
	j = 0
  end
  return [center, ary]
end

def getvalue(coordinate, map)
  return map[(coordinate[0] - 1) * 9 + coordinate[1] - 1]
end

def search(ary, map)
  sign = 0
  i = 0
  while i < ary[1].length
   	if getvalue(ary[1][i], map) == -2
	  sign += 1
	end
	i += 1
  end
  if sign == getvalue(ary[0], map)
	puts 'This minefield: OK'
  else
  	unknown = 0
  	i = 0
	while i < ary[1].length
	  if getvalue(ary[1][i], map) == -1
	    unknown += 1
	  end
	  i += 1
	end
	if unknown == getvalue(ary[0], map)
	  i = 0
	  while i < ary[1].length
	    if getvalue(ary[1][i], map) == -1
		  puts 'Please sign ' + ary[1][i].to_s
		end
		i += 1
	  end
   	end
  end
end
=begin
def randcheck
  x = rand(10)
  y = rand(10)
  puts 'Please check ' + [x, y].to_s
end

def deadlock(map, map2)
  key = 0
  i = 0
  while i < map.length
	if map[i] != map2[i]
	  key = 1
	  break
	end
    i += 1
  end
  if key == 0
	randcheck
  end
end
=end
map = [0,0,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,1,1,
	   0,0,0,0,0,0,1,2,-1,
	   0,0,0,0,0,1,2,-1,-1,
	   0,0,0,0,0,2,-1,-1,-1,
	   1,1,0,0,0,2,-1,-1,-1,
	   -1,1,0,0,0,2,-1,-1,-1,
	   -1,1,1,1,1,2,-1,-1,-1,
	   -1,-1,-1,-1,-1,-1,-1,-1,-1]
	   
search(minefield([gets.chomp.to_i, gets.chomp.to_i]), map)
sleep(50)
