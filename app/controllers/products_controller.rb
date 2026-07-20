class ProductsController < ApplicationController
  def index
    # Переменные с @ это переменные экземпляра, они используются для обмена данных с представлением
    # они доступны в представлении
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end  

  private

  def product_params
    params.expect(product: [ :name ])
  end
end
