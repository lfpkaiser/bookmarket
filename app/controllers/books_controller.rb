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
      redirect_to books_path(@book)
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def buy
    @book = Book.find(params[:id])
    @order = Order.new(order_params)
    @order.book = @book
    @order.user = current_user

    if @order.quantity <= @book.quantity
      @order.save
      @book.quantity -= @order.quantity
      @book.save
      redirect_to books_path, notice: 'Order placed successfully.'
    else
      redirect_to books_path, alert: 'Insufficient quantity.'
    end
  end 

  private

  def book_params
    params.require(:book).permit(:name, :author, :genre, :year, :price, :quantity, :photo)
  end

  def order_params
    params.require(:order).permit(:quantity)
  end
end
