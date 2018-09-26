require './UserInput'
require './DrawingInterpreter'

class DrawingTool

  def initialize
    @userInput = UserInput.new
    @drawingInterpreter = DrawingInterpreter.new
  end

  def run
    loop do
      @command = @userInput.read
      if @command.inputCorrect
        break if @command.parameters[:letter] == 'Q'
        @drawingInterpreter.start @command
      end
    end
  end

end
