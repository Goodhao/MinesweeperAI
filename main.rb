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
      if (x >= 1 && x <= 9) && (y >= 1 && y <= 9)
  	    ary.push([x, y])
      end
      j += 1
    end
    i += 1
    j = 0
  end
  return [center, ary]
end

def getvalue(coordinate)
  return $map[(coordinate[0] - 1) * 9 + coordinate[1] - 1]
end

def unknown(ary)
  sum = 0
  i = 0
  while i < ary[1].length
    if getvalue(ary[1][i]) == -1
      sum += 1
    end
    i += 1
  end
  return sum
end

def sign(ary)
  sum = 0
  i = 0
  while i < ary[1].length
    if getvalue(ary[1][i]) == -2
      sum += 1
    end
    i += 1
  end
  return sum
end

def search(ary)
  if sign(ary) == getvalue(ary[0]) && unknown(ary) != 0
    puts 'This minefield of ' + ary[0].to_s + ': OK'
    sleep(50)
    exit(0)
  else
    if unknown(ary) + sign(ary) == getvalue(ary[0])
      i = 0
      while i < ary[1].length
        if getvalue(ary[1][i]) == -1
	        puts 'Please sign ' + ary[1][i].to_s
          sleep(50)
          exit(0)
        end
        i += 1
      end
    end
  end
end
$map = []

content = File.read('map.txt')
while 1
  n = content.index(',')
  if n != nil
    str = content[0, n]
    content = content[n + 1, content.length - n - 1]
    $map.push(str.to_i)
  else
    str = content[0, content.length]
    $map.push(str.to_i)
    break
  end
end

x = 1
y = 1
while x < 10
  while y < 10
    value = getvalue([x, y])
    if value != 0 && value != -1 && value != -2
      search(minefield([x, y]))
    end
    y += 1
  end
  x += 1
  y = 1
end

sleep(50)
