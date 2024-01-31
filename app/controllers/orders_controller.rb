class OrdersController < ApplicationController
  before_action :set_user, :set_book, only: %i[new create]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = @book.orders.build
  end

  def create
    @order = @book.orders.build(order_params)
    if @order.save
      redirect_to @order, notice: "Ordem criada com sucesso."
    else
      render :new, notice: "Falha ao criar pedido, tente novamente."
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: "Ordem atualizada com sucesso."
    else
      render :edit, notice: "Falha ao atualizar pedido, tente novamente."
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def order_params
    params.require(:order).permit(:quantity, :total_price)
  end

  def set_user
    @user = current_user
  end

end
