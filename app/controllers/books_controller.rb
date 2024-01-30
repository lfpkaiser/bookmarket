class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @order = Order.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :genre, :year, :price, :quantity,  photos: [])
  end
end
