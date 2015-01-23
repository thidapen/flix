class Movie < ActiveRecord::Base
	def flop?
    	total_gross.blank? || total_gross < 50000000
   	end 
   	def self.upcoming
   		where("created_at >= ?", Time.now).order("updated_at")
   	end
   	mount_uploader :image_file_name, ImageFileNameUploader
   	validates :title, :released_on, presence: true
   	validates :description, length: { minimum: 25 }
  	validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
	validates :image_file_name, allow_blank: true, format: {
	   with:    /\w+.(gif|jpg|png)\z/i,
	   message: "must reference a GIF, JPG, or PNG image"
	}
  	has_many :registrations, dependent: :destroy
  	# has_many :reviews
    has_many :reviews, dependent: :destroy

# RATINGS = %w(G PG PG-13 R NC-17)
	# validates :rating, inclusion: { in: RATINGS }
	# <%= f.select :rating, Movie::RATINGS, prompt: "Pick one" %>
	# select "PG-13", :from => "movie_rating"
	
	def average_stars
	  	reviews.average(:stars)
	end
end
