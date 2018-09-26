class UserInput

  def read
    loop do
      print "enter command:  "
      @strCommand = gets.chomp
      break if @strCommand.size != 0
    end
    @strCommand = @strCommand.split(' ')
    validateInput
  end

  def validateInput
    case @strCommand[0]
    when 'C'
      if @strCommand.size == 3
        parameters = {letter:'C', width:@strCommand[1].to_i, height:@strCommand[2].to_i}
        @data = Command.new true, parameters
      else
        @data = Command.new false
        puts 'missing parameters'
      end
    when 'L'
      if @strCommand.size == 5
        parameters = {letter:'L', x1:@strCommand[1].to_i, y1:@strCommand[2].to_i, x2:@strCommand[3].to_i, y2:@strCommand[4].to_i}
        @data = Command.new true, parameters
      else
        @data = Command.new false
        puts 'missing parameters'
      end
    when 'R'
      if @strCommand.size == 5
        parameters = {letter:'R', x1:@strCommand[1].to_i, y1:@strCommand[2].to_i, x2:@strCommand[3].to_i, y2:@strCommand[4].to_i}
        @data = Command.new true, parameters
      else
        @data = Command.new false
        puts 'missing parameters'
      end
    when 'B'
      if @strCommand.size == 4
        parameters = {letter:'B', x:@strCommand[1].to_i, y:@strCommand[2].to_i, colour:@strCommand[3]}
        @data = Command.new true, parameters
      else
        @data = Command.new false
        puts 'missing parameters'
      end
    when 'Q'
      if @strCommand.size == 1
        parameters = {letter:'Q'}
        @data = Command.new true, parameters
      end
    else
      @data = Command.new false
      puts 'Command not found'
    end
    @data
  end

end


class Command
  attr_reader :inputCorrect, :parameters

  def initialize inputCorrect, parameters={}
    @inputCorrect = inputCorrect
    @parameters = parameters
  end
end
