class ProductInfosController < ApplicationController
  before_action :set_product_info, only: [:show, :edit, :update, :destroy]

  # GET /product_infos
  # GET /product_infos.json
  def index
    @product_infos = ProductInfo.all
  end

  # GET /product_infos/1
  # GET /product_infos/1.json
  def show
  end

  # GET /product_infos/new
  def new
    @product_info = ProductInfo.new
  end

  # GET /product_infos/1/edit
  def edit
  end

  # POST /product_infos
  # POST /product_infos.json
  def create
    @product_info = ProductInfo.new(product_info_params)

    respond_to do |format|
      if @product_info.save
        format.html { redirect_to @product_info, notice: 'Product info was successfully created.' }
        format.json { render :show, status: :created, location: @product_info }
      else
        format.html { render :new }
        format.json { render json: @product_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_infos/1
  # PATCH/PUT /product_infos/1.json
  def update
    respond_to do |format|
      if @product_info.update(product_info_params)
        format.html { redirect_to @product_info, notice: 'Product info was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_info }
      else
        format.html { render :edit }
        format.json { render json: @product_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_infos/1
  # DELETE /product_infos/1.json
  def destroy
    @product_info.destroy
    respond_to do |format|
      format.html { redirect_to product_infos_url, notice: 'Product info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_info
      @product_info = ProductInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_info_params
      params.require(:product_info).permit(:image_url, :description, :old_price, :product_hot, :product_sale, :product_bestselled, :product_prominent)
    end
end
