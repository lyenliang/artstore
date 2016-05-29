class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show 
    @product = Product.find(params[:id])
  end
  
  def add_to_cart
    @product = Product.find(params[:id])
    
    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "已成功將 #{@product} 加入購物車"
    else 
      flash[:warning] = "購物車裡已經有這個商品了"
    end
    redirect_to :back
  end
end
