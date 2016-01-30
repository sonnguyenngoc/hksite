class Admin::SlideShowsController < ApplicationController
  before_action :set_slide_show, only: [:show, :edit, :update, :destroy]

  # GET /slide_shows
  # GET /slide_shows.json
  def index
    @slide_shows = SlideShow.all
  end

  # GET /slide_shows/1
  # GET /slide_shows/1.json
  def show
  end

  # GET /slide_shows/new
  def new
    @slide_show = SlideShow.new
  end

  # GET /slide_shows/1/edit
  def edit
  end

  # POST /slide_shows
  # POST /slide_shows.json
  def create
    @slide_show = SlideShow.new(slide_show_params)

    respond_to do |format|
      if @slide_show.save
        format.html { redirect_to [:admin, @slide_show], notice: 'Tạo slideshow mới thành công.' }
        format.json { render :show, status: :created, location: @slide_show }
      else
        format.html { render :new }
        format.json { render json: @slide_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slide_shows/1
  # PATCH/PUT /slide_shows/1.json
  def update
    respond_to do |format|
      if @slide_show.update(slide_show_params)
        format.html { redirect_to [:admin, @slide_show], notice: 'Cập nhật thông tin slideshow thành công.' }
        format.json { render :show, status: :ok, location: @slide_show }
      else
        format.html { render :edit }
        format.json { render json: @slide_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slide_shows/1
  # DELETE /slide_shows/1.json
  def destroy
    @slide_show.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, @slide_show] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide_show
      @slide_show = SlideShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_show_params
      params.require(:slide_show).permit(:image_url, :title,:description, :link_to)
    end
end
