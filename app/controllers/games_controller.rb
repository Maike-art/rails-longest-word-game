require 'open-uri'
require 'json'
class GamesController < ApplicationController

  def new
    letters = ('a'...'z').to_a
    @letters = letters.sample(10)
  end

  def word_included?(letters, word)
   word.chars.all? {|element| word.count(element) <= letters.count(element) }
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @valid_word = valid_word?(@word)
    @word_included = word_included?(@letters, @word)
  end

  private


  def valid_word?(word)
    request_valid = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
   json = JSON.parse(request_valid.read)
    json["found"]
  end
end
