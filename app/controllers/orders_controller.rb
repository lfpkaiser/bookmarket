class OrdersController < ApplicationController
  # before_action :set_user
  before_action :set_book, only: [:new]

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create #criar pedido
    # checar se a quantidade está disponível para venda.
    @order = Order.create!(book_id: params[:book_id], user_id: current_user.id, quantity: params[:quantity])
    # @order = @book.orders.build(order_params)
    if @order.save
      redirect_to books_path, notice: "Ordem criada com sucesso."
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
    #apos o final redirecionar para outra página para outra página -> *status da ordem*
  end

  private

  def set_book
    @book = Book.find_by(params[:book_id])
  end

  def order_params
    params.require(:order).permit(:book_id, :quantity, :user_id)
  end

  def set_user
    @user = current_user
  end

end
