class Output

  def showCanva cuadro
    cuadro.each do |line|
        line.each { |e| print e }
        puts
    end
    puts
  end

end
