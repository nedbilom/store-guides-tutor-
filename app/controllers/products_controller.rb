class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ] # Разрешаем доступ не авторизированным пользователям для маршрутов index и show
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_platforms, only: %i[ new create edit update ]

  def index
    # Переменные с @ это переменные экземпляра, они используются для обмена данных с представлением
    # они доступны в представлении
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @platform_holders = PlatformHolder.all
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
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.expect(product: [ :name, :description, :featured_image, :inventory_count, :limited_count, :platform_holder_id ])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_platforms
    @platform_holders = PlatformHolder.all
  end
end
