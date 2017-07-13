class ProductsController < ApplicationController

  def index
    if current_order.status == "Paid"
      session[:order_id] = nil
    end
    @products = Product.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @order = current_order
    @product = Product.find(params[:id])
    @order_items = current_order.order_items.new
    respond_to do |format|
      format.html { render :show}
      format.js
    end
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:product][:images]
        params[:product][:images].each { |image|
          @product.images.create(image: image)
        }
      end
      flash[:notice] = "Product created successfully!"
      redirect_to products_path
    else
      render :new
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :price, :size, :speed, :description)
  end

end
