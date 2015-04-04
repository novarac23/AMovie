module MoviesHelper
  def owned(movie)
    current_user.id == movie.user_id
  end
end
