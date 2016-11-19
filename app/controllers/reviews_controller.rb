class ReviewsController < ApplicationController
  before_action :set_book
  before_action :check_logged_in_user
  before_action :check_user

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    if @review.save
      flash[:success] = "Review created."
      redirect_to user_book_url(@book.user, @book)
    else
      render 'new'
    end

  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:heading, :rating, :body)
  end

  def check_user
    unless is_current_user?(@book.user)
      flash[:info] = "Unauthorized access. Only the owner of the list can create review."
      redirect_to user_books_url(current_user)
    end
  end

end
