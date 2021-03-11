require 'rails_helper'

describe 'find all movies with the same director' do
  it "returns similar movies" do
    movie_1 = Movie.create(title: 'The Advengers', director: 'Joss Whedon')
    movie_2 = Movie.create(title: 'Angel', director: 'Joss Whedon')
    movie_3 = Movie.create(title: 'Interstellar', director: 'Christopher Nolan')
    Movie.search_similar_movies('Joss Whedon').should eq [movie_1, movie_2]
  end
  
  it "should not return similar movies with the same director" do
    movie_1 = Movie.create(title: 'The Advengers', director: 'Joss Whedon')
    movie_2 = Movie.create(title: 'Angel', director: 'Joss Whedon')
    movie_3 = Movie.create(title: 'Interstellar', director: 'Christopher Nolan')
    expect(Movie.search_similar_movies('Joss Whedon')).not_to eq [movie3]
  end
end