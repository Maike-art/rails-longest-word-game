require "open-uri"
require "json"
class GamesController < ApplicationController

  def new
    letters = ('a'...'z').to_a
    @letters = letters.sample(10)
  end

  def score
    @letters = params[:letters]
    @valid_word = valid_word?(@word)
    @word = params[:word]
  end

  private

  def valid_word?(word)
    request_valid = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    JSON.parse(request_valid.read)
  end
end
