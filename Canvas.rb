class Canvas
  attr_reader :cuadro, :width, :height

  def initialize width, height
    @cuadro = Array.new(height+2) {Array.new(width+2)}
    @width = width
    @height = height

    y=0
    x=0
    @cuadro.each do |line|
      if y==0 || y==height+1
        line.each do |e|
          line.delete_at(x)
          line.insert(x, '-')
          x += 1
        end
      else
        line.each do |e|
          if x==0 || x==width+1
            line.delete_at(x)
            line.insert(x, '|')
          else
            line.delete_at(x)
            line.insert(x, ' ')
          end
          x += 1
        end
      end
       y += 1
       x=0
    end

  end

  def line x1, y1, x2, y2
    i=0
    if x1==x2
      if y1 > y2
        aux = y1
        y1 = y2
        y2 = aux
      end
      for i in y1..y2
        @cuadro[i][x1] = 'X'
      end
    end

    if y1==y2
      if x1 > x2
        aux = x1
        x1 = x2
        x2 = aux
      end
      for i in x1..x2
        @cuadro[y1][i] = 'X'
      end
    end

  end

  def rectangle x1, y1, x2, y2
    line x1, y1, x2, y1
    line x2, y2, x1, y2
    line x1, y1, x1, y2
    line x2, y2, x2, y1
  end

  def fillArea x, y, colour
    if @cuadro[y][x] != '-' && @cuadro[y][x] != '|' && @cuadro[y][x] != 'X' && @cuadro[y][x] != colour
      @cuadro[y][x] = colour
      fillArea x+1, y, colour
      fillArea x, y+1, colour
      fillArea x-1, y, colour
      fillArea x, y-1, colour
    end
  end

end
