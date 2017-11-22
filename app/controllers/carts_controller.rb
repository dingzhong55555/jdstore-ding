class CartsController < ApplicationController
  def index

  end

  def clean
    current_cart.clean!
    redirect_to :back
    flash[:notice] = "购物车已经清空"
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by_product_id(params[:id])
    @cart_item.destroy
    redirect_to :back
    flash[:warnig] = "已经删除#{@cart_item.product.title}"
  end
end
