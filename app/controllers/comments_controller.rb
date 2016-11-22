class CommentsController < ApplicationController
  before_action :set_book

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user_id = params[:user_id]
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.json { render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end



  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
