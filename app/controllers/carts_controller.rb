class CartsController < ApplicationController
  def index

  end

  def clean
    current_cart.clean!
    redirect_to :back
    flash[:notice] = "购物车已经清空"
  end

end
