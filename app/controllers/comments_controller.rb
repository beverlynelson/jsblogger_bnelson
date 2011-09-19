class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = Comment.new(params[:comment])
    flash[:message] = "Comment '#{@comment.author_name}' was created."
    @comment.save!
    redirect_to articles_path(@comment.article)
  end

  def destroy
  end

end
