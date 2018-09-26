require './Canvas'
require './Output'


class DrawingInterpreter

  def initialize
    @draw = Output.new
    @thereIsCanva = false
  end

  def start command
    @command = command
    @canDraw = false
    validateCommand
    drawCommand
  end

  def validateCommand
    case @command.parameters[:letter]
    when 'C'
      if @command.parameters[:width] > 0 && @command.parameters[:height] > 0
        @canva = Canvas.new @command.parameters[:width], @command.parameters[:height]
        @thereIsCanva = true
        @canDraw = true
      end
    when 'L'
      if @thereIsCanva
        if @command.parameters[:x1]>0 && @command.parameters[:x1]<=@canva.width && @command.parameters[:y1]>0 && @command.parameters[:y1]<=@canva.height
          if @command.parameters[:x2]>0 && @command.parameters[:x2]<=@canva.width && @command.parameters[:y2]>0 && @command.parameters[:y2]<=@canva.height
            if @command.parameters[:x1] == @command.parameters[:x2] || @command.parameters[:y1] == @command.parameters[:y2]
              @canva.line @command.parameters[:x1], @command.parameters[:y1], @command.parameters[:x2], @command.parameters[:y2]
              @canDraw = true
            end
          end
        end
      end
    when 'R'
      if @thereIsCanva
        if @command.parameters[:x1]>0 && @command.parameters[:x1]<=@canva.width && @command.parameters[:y1]>0 && @command.parameters[:y1]<=@canva.height
          if @command.parameters[:x1]>0 && @command.parameters[:x1]<=@canva.width && @command.parameters[:y1]>0 && @command.parameters[:y1]<=@canva.height
            if @command.parameters[:x1] != @command.parameters[:x2] && @command.parameters[:y1] != @command.parameters[:y2]
              @canva.rectangle @command.parameters[:x1], @command.parameters[:y1], @command.parameters[:x2], @command.parameters[:y2]
              @canDraw = true
            end
          end
        end
      end
    when 'B'
      if @thereIsCanva
        if @command.parameters[:x]>0 && @command.parameters[:x]<=@canva.width && @command.parameters[:y]>0 && @command.parameters[:y]<=@canva.height
            @canva.fillArea @command.parameters[:x], @command.parameters[:y], @command.parameters[:colour]
            @canDraw = true
          end
        end
    end
  end

  def drawCommand
    if @thereIsCanva
      if @canDraw
        @draw.showCanva @canva.cuadro
      else
        puts 'Wrong parameters'
      end
    else
      puts 'There isn\'t canvas'
    end
  end
end
