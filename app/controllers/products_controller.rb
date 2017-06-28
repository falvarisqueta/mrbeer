class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :add_stock, :stock_product, :sell, :sell_quantity]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def selling_dashboard
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def add_stock
  end

  def sell_quantity
  end

  def sell
    respond_to do |format|
      quantity = params[:quantity].nil? ? params[:product][:quantity].to_f : params[:quantity].to_f
      if @product.sell(quantity)
        format.html { redirect_to selling_dashboard_products_path, notice: "Vendido #{quantity.to_f} de #{@product.name}." }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def stock_product
    respond_to do |format|
      if @product.add_stock(product_params["quantity"].to_f)
        format.html { redirect_to products_url, notice: 'Stock actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Producto Creado.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Producto Actualizado.s' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Producto Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(
        :name,
        :description,
        :provider_id,
        :category_id,
        :cost,
        :sell_price,
        :stock,
        :quantity
      )
    end
end
