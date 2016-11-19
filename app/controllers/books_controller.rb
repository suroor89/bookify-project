class BooksController < ApplicationController
  before_action :set_user
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :check_logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = @user.books.includes(:categories).by_category(params[:filter]).search(params[:keyword]).paginate(page: params[:page], per_page: 5)
    @categories = Category.categories_from_user(@user).distinct
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = @user.books.build
    @categories = Category.all
  end

  # GET /books/1/edit
  def edit
    @categories = Category.all
  end

  def create
    @book = @user.books.build(book_params)
      if @book.save
        flash[:success] = "Book was successfully created."
        redirect_to user_books_path(@user)
      else
        render 'new'
      end
  end

  def update
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to user_book_url([@user, @book])
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Book was successfully deleted."
    redirect_to user_books_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_book
      @book = @user.books.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :description, :amazon_id, category_ids: [])
    end
end
