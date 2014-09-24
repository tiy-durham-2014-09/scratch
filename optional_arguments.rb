class Rectangle
  def initialize(width, height = width * 1.61)
    @width = width
    @height = height
  end
end

def sum(num, *nums)
  p num
  p nums
  nums.reduce(num) { |tot, n| tot += n }
end

sum
sum(1)
sum(1, 2)
sum(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

class Polygon
  attr_reader :points

  def initialize(p1, p2, p3, *points)
    @points = [p1, p2, p3] + points
  end
end


class LazyPolygon
  attr_reader :points

  def initialize(*points)
    raise ArgumentError.new("Polygons require at least 3 points.") if points.size < 3
    @points = points
  end
end
