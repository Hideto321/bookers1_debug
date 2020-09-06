class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "successfully created book!"
    else
      render 'index'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "successfully updated book!"
    else
      render 'edit'
    end
  end

  # def update
  #   if @book.update(book_params)
  #     redirect_to books_path, notice: 'Book was successfully updated.'
  #   else
  #     raise @book.error
  #     render :index , notice: 'update was failed'
  #   end
  # end

  # if @books = Book.find(book.id])
  #   @book.update(book.id)
  #   redirect_to book_path(@book), notice: "successfully updated book!"
  # else
  #   render 'edit'
  # end

  def destroy
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
