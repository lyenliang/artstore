class CartItemsController < ApplicationController
    
    before_action :authenticate_user!
    
    def destroy
        @cart = current_cart
        @item = @cart.cart_items.find_by(product_id: params[:id])
        @product = @item.product
        @item.destroy
        
        flash[:warning] = "成功將 #{@product.title} 從購物車刪除！"
        redirect_to :back
    end
    
    # update quantity under "products/id" path
    def update
        @cart = current_cart
        @item = @cart.cart_items.find_by(product_id: params[:id])
        
        # 若 庫存 >= 買家指定的數量
        if @item.product.quantity >= item_params[:quantity].to_i
            @item.update(item_params)
            flash[:notice] = "成功變更數量"
        else
            flash[:warning] = "庫存不足"
        end
        
        redirect_to carts_path
    end
    
    private 
    
    def item_params
        params.require(:cart_item).permit(:quantity)
    end
end
