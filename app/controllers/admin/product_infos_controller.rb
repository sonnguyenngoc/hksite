class Admin::ProductInfosController < ApplicationController
  before_action :set_product_info, only: [:show, :edit, :update, :destroy]
  
  def update_info
    
  end
  
  # GET /product_infos
  # GET /product_infos.json
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
    @product_infos = ProductInfo.all
  end

  # GET /product_infos/1
  # GET /product_infos/1.json
  def show
  end

  # GET /product_infos/new
  def new
    @product_info = ProductInfo.new(product_id: params[:product_id])    
  end

  # GET /product_infos/1/edit
  def edit

  end

  # POST /product_infos
  # POST /product_infos.json
  def create    
    @product_info = ProductInfo.new(product_info_params)
    @product_info.product_hot = nil if !product_info_params[:product_hot].present?
    @product_info.product_sale = nil if !product_info_params[:product_sale].present?
    @product_info.product_bestselled = nil if !product_info_params[:product_bestselled].present?
    @product_info.product_prominent = nil if !product_info_params[:product_prominent].present?
    @product_info.product_new = nil if !product_info_params[:product_new].present?


    respond_to do |format|
      if @product_info.save
        format.html { redirect_to [:admin, @product_info], notice: 'Product info was successfully created.' }
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
    @product_info.product_hot = nil if !product_info_params[:product_hot].present?
    @product_info.product_sale = nil if !product_info_params[:product_sale].present?
    @product_info.product_bestselled = nil if !product_info_params[:product_bestselled].present?
    @product_info.product_prominent = nil if !product_info_params[:product_prominent].present?
    @product_info.product_new = nil if !product_info_params[:product_new].present?
    
    respond_to do |format|
      if @product_info.update(product_info_params)
        format.html { redirect_to [:admin, @product_info], notice: 'Product info was successfully updated.' }
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
      format.html { redirect_to admin_product_infos_url, notice: 'Product info was successfully destroyed.' }
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
      params.require(:product_info).permit(:image_url, :description, :old_price, :product_hot, :product_sale, :product_bestselled, :product_prominent, :product_new, :product_id, :note, :sale_off_price, :sale_price, :bonus_product)
    end
end
