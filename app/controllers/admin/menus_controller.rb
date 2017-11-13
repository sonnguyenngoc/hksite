class Admin::MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all.order("created_at ASC")
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @categories = Category.all
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
    @categories = Category.all
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)      
    @menu.categories.clear
    if params[:category_ids].present?
      params[:category_ids].each do |id|      
        @menu.categories << Category.find(id)
      end
    end
    
    respond_to do |format|
      if @menu.save
        format.html { redirect_to [:admin, @menu], notice: 'Tạo mới menu thành công.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    @menu.categories.clear
    if params[:category_ids].present?
        params[:category_ids].each do |id|      
          @menu.categories << Category.find(id)
        end
    end
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to [:admin, @menu], notice: 'Cập nhật thông tin menu thành công.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, @menu] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:menu_image, :image_url, :title, :description, :level, parent_ids: [])
    end
end
