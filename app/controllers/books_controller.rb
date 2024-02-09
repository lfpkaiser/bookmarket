class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.search_by_name_or_author(params[:query])
      if @books.empty?
        flash[:notice] = "No books found with the name or author: #{params[:query]}"
      else
        @books = Book.search_by_name_or_author(params[:query])
      end
    else
      @books = Book.all
    end
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
      redirect_to my_books_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to my_books_path
  end

  def my_books
    @books = current_user.books
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to my_books_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :genre, :year, :price, :quantity, :photo, :descricao)
  end

  def order_params
    params.require(:order).permit(:quantity)
  end
end
