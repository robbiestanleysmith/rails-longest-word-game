require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:user_guess]
    @letters = params[:letters]
    @english_word = is_english_word?(@word)
    @formable_word = word_can_be_formed_from_letters?(@word, @letters)
    # if @word can be formed from @letters && @word is_english_word?
    # @response = "Congratulations! @word is an English word!"
    # elsif is_english_word?
    # @response = "Sorry, @word can't be built out of params[:letters]"
    # elsif word_can_be_formed_from_letters?
    # @response = "Sorry, @word doesn't seem to be a valid English word.."
    # else
    # @response = "Sorry, @word isn't an English word and can't be built out of params[:letters] either!"
  end

  def word_can_be_formed_from_letters?(word, letters)
    each_letter_of_word = word.split('')
    each_letter_of_word.each do |letter| {
      word_count = letter.count

    }




  end

  def is_english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    html_file = URI.open(url).read
    @results_hash = JSON.parse(html_file)
    return @results_hash[:found]
  end
end
