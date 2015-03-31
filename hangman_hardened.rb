require 'byebug'
class Hangman

  attr_accessor :game_state

  def initialize(picker, guesser)
    @picker = picker
    @guesser = guesser
    @guesses = 0
  end

  def over?
    won? || lost?
  end

  def won?
    @game_state.all?
  end

  def lost?
    @guesses > 7
  end

  def show_game_state
    render = @game_state.map {|char| char.nil? ? "_" : char }
    render.join(" ")
  end



  def play

    @game_state = @picker.make_game_state

    until over?
      puts show_game_state
      guess = @guesser.guess
      indices = @picker.handle_guess_response(guess)
      indices.nil? ? @guesses += 1 : indices.each {|index| @game_state[index] = guess}
    end

    puts "Awesome! You won in #{@guesses} guesses!" if won?
    if lost? && @picker.is_a?(ComputerPlayer)
      puts "Sorry, you lost. The word was #{@picker.secret_word}"
    end
  end


end


class HumanPlayer


  def initialize()
  end

  def make_game_state
    puts "Think of a word. How many letters are in your word?"
    begin
    length = gets.chomp
    raise "Need a number" unless length =~ /\d+/
    rescue
      puts "Please enter a number."
      retry
    end
    
    Array.new(length.to_i) {nil}
  end


  def guess
    puts "What's your guess?"
    begin
      guess = gets.chomp.downcase
      check_guess(guess)
    rescue
      puts "We need a single letter. Guess again."
      retry
    end

    guess
  end

  def check_guess(guess)
    raise "Not a valid guess" unless guess.ord.between?(97, 122) && guess.length == 1

  end

  def handle_guess_response(guess)
    puts "Does Your word have #{guess}? y/n"
    response=gets.chomp.downcase
    until response =~ /y|n/
      puts "Please input y or n."
      response=gets.chomp.downcase
    end

    if response == "y"
      indices = []
      puts "If each letter in your word is a number, starting from 1. Type each
      time #{guess} appears. If it is in your word multiple times, type those
      letters separated by a coma. For example, 1 is a valid answer, as is '1,4'"
      indices = gets.chomp
      indices = indices.split(",").map! {|num| num.to_i - 1 }
    end

    indices

  end




  def good_guess?(guess,word)
    word.include?(guess)
  end

end


class ComputerPlayer
  attr_reader :secret_word

  def initialize
    @dictionary = File.readlines("dictionary.txt")
    @secret_word = pick_secret_word
    @guesses = []
  end

  def make_game_state
    Array.new(@secret_word.length) {nil}
  end

  def guess
    guess = ('a'..'z').to_a.sample
    until !@guesses.include?(guess)
      guess = ('a'..'z').to_a.sample
    end

    @guesses << guess
    guess
  end

  def filter_guesses
    #filters
  end


  def pick_secret_word
    @dictionary.select{|word| word.length <= 8 }.sample.chomp
  end

  def handle_guess_response(guess)

    if good_guess?(guess)
      indices = []
      @secret_word.split('').each_with_index do |char, index|
        indices << index if char == guess
      end
    else
      puts "guess again!"

    end
    indices
  end

  def good_guess?(guess)
    @secret_word.include?(guess)

  end

end







    #    ---------
    #    |       ||
    #    |       ||
    #    O       ||
    #   /|\      ||
    #    |       ||
    #   / \      ||
    #            ||
    #            ||
    # ___________||
