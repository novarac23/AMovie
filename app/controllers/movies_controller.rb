class MoviesController < ApplicationController
    
  before_action :find_movie, except: [:index,:new,:create,:search]

  before_action :authenticate_user!, except: [:index,:show]

  def index
    @movies = Movie.all
  end

  def show
    @comment = Comment.new
    @shown_comments = Comment.where(movie_id: @movie.id)
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(safe_params)

    if @movie.save
      redirect_to '/'
    end
  end

  def edit
    if owned(@movie)
      @movie
    else
      redirect_to '/'
    end
  end

  def update
    if @movie.update(safe_params)
      redirect_to '/'
    end
  end

  def destroy
    if owned(@movie)
      @movie.destroy
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def search
    if params[:search].present?
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.all
    end
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def safe_params
    params.require(:movie).permit(:title, :description, :author,  :image)
  end

  def owned(movie)
    current_user.id == movie.user_id
  end

end
