class ProductsController < ApplicationController

  def index
    @products =  Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.order("id DESC")
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "加入购物车"
    else
      flash[:notice] = "#{@product.title}已经在购物车中！"
    end

    redirect_to :back
  end

  def add_to_like
    @product = Product.find(params[:id])

    if !current_user.liked_products.include?(@product)
      current_user.add_product_to_likes(@product)
      flash[:notice] = "加入收藏夹"
    else
      flash[:notice] = "#{@product.title}已在收藏夹中"
    end

    redirect_to :back
  end

end
