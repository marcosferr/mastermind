# frozen_string_literal: true

class Game
    attr_writer :secret_code
  def initialize
    @secret_code = Array.new 4
    @corrects = 0
    @misplaced = 0
    @broke = false
    @computer_corrects = Array.new 4
    @codebreaker = false
    
    
  end

  def generate_code
    @secret_code.map! { |_val| val = rand(1..6).to_s }
  end

  def guess(code)
    if @secret_code.join('') == (code)
      puts 'The code is broken'
      @broke == true
    end
    4.times do |index|
      if @secret_code.count(code[index]).positive?
        if @secret_code.find_index(code[index]) == index
          @corrects += 1
          @computer_corrects[index] = code[index]
        else
          @misplaced += 1
        end
      end
    end
    puts "#{@corrects} in the right place"
    puts "#{@misplaced} corrects but in the wrong place"
    @corrects = 0
    @misplaced = 0
  end

  def play
    puts "Do you to be the code breaker? y/n"
    (gets.chomp == "y") ? (codebreaker=true) : (codebreaker= false)
    if(codebreaker)
    generate_code
    puts 'Welcome to mastermind guess the code'
    12.times do |index|
      puts 'Please enter your guess 1-6 4 digit code'
      puts "Guess n #{index + 1}"
      input = gets.chomp
      guess input
      break if @broke == true
    end
    puts "The code was #{@secret_code.join('')}"

else
    puts "Please enter your secret code to be broken"
    set_code gets.chomp
    computer_plays
end
end



  def set_code code
    @secret_code = code.split("")
  end
  def computer_plays
    @computer_code = Array.new 4
    12.times do |index|
        4.times do |index|
            if @computer_corrects[index] == nil 
                @computer_code[index] = rand(1..6).to_s
            else
                @computer_code[index] =@computer_code[index]
            end
        end
        puts "Guess n #{index + 1}"
        guess @computer_code
        break if @broke == true
      end
   
    

    sleep 1

  end


end


mastermind = Game.new
mastermind.play
