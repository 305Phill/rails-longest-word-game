require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = ["Y", "Z", "D", "U", "Q", "E", "Z", "Y", "Q", "I"]
  end


    # if the word is valid according to the grid and is an English word, the score is computed and displa


  def score
    @word = params[:word]
    @letters = params[:letters]
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private
  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

end
