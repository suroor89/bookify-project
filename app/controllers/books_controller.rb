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
  end

  # POST /books
  # POST /books.json
  def create
    @book = @user.books.build(book_params)
      if @book.save
        flash[:success] = "Book was successfully created."
        redirect_to user_books_path(@user)
      else
        render 'new'
      end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully deleted.' }
      format.json { head :no_content }
    end
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
