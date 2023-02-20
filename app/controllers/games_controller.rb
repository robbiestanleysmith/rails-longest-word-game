require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:user_guess].upcase
    @letters = params[:letters].split
    @english_word = english_word?(@word)
    @formable_word = word_can_be_formed_from_letters?(@word, @letters)
  end

  private

  def word_can_be_formed_from_letters?(word, letters)
    @included = word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    html_file = URI.open(url).read
    json = JSON.parse(html_file)
    json['found']
  end
end
