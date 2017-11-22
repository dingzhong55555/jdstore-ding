class CartItemsController < ApplicationController
    def update
      @cart = current_cart
      @cart_item = @cart.cart_items.find_by(product_id: params[:id])
      if @cart_item.product.quantity >= @cart_item.quantity
         @cart_item.update(cart_item_params)
         flash[:notice] = "数量已经更新"
      else
        flash[:warning] = "数量不足以更新"
      end

      redirect_to carts_path
    end

    def destroy
      @cart_item = current_cart.cart_items.find_by_product_id(params[:id])
      @cart_item.destroy
      redirect_to :back
      flash[:warnig] = "已经删除#{@cart_item.product.title}"
    end

    private

    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
end
