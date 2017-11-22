class ProductsController < ApplicationController

  def index
    @products =  Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    else
      flash[:notice] = "#{@product.title}已经在购物车中！"
    end

    redirect_to :back
    flash[:notice] = "加入购物车"
  end
end
