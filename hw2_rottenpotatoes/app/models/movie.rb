class Movie < ActiveRecord::Base
  def self.get_all_ratings
     ratings = Array.new
     Movie.all.each do |movie|
        ratings << movie.rating
     end
     ratings.uniq!
     return ratings
  end
end
