class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new(safe_comment_params)
    @comment.user_id = current_user.id
    @comment.movie = @movie
    if @comment.save
      redirect_to movie_path(@movie)
      #redirect_to '/'
    end
  end

  private

  def safe_comment_params
    params.require(:comment).permit(:rating, :text)
  end

end

