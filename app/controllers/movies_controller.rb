class MoviesController < ApplicationController
	before_action :set_movie, only:[:show, :edit, :update, :destroy]
	def index
  		@movies = Movie.all
  		# @movies = Movie.upcoming
  		#@movies = Movie.where("created_at >= ?", Time.now).order("updated_at")
	end
	def show

	end
	def edit # for edit by id each video

	end

	def update
		@movie = Movie.find(params[:id])
  		if @movie.update(movie_params)
  			redirect_to @movie, notice: "Movie successfully updated!"
  		else
  			render :edit
  	   	end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
	    if @movie.save
	    	    redirect_to @movie, notice: "Movie successfully created!"
		else
			render :new
		end
	end
	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
	 	redirect_to root_path, alert: "Movie successfully deleted!"
		# redirect_to movies_url, danger: "Danger, Will Robinson!"
		# redirect_to movies_url, danger: "I'm sorry, Dave, I'm afraid I can't do that!"

	end

	private
	def set_movie
		@movie = Movie.find(params[:id])
	end
	def movie_params
	params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :image_file_name, :capacity)
	end
end

