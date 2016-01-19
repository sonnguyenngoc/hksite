require 'test_helper'

class SlideShowsControllerTest < ActionController::TestCase
  setup do
    @slide_show = slide_shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slide_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slide_show" do
    assert_difference('SlideShow.count') do
      post :create, slide_show: { description: @slide_show.description, image_url: @slide_show.image_url, link_to: @slide_show.link_to }
    end

    assert_redirected_to slide_show_path(assigns(:slide_show))
  end

  test "should show slide_show" do
    get :show, id: @slide_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slide_show
    assert_response :success
  end

  test "should update slide_show" do
    patch :update, id: @slide_show, slide_show: { description: @slide_show.description, image_url: @slide_show.image_url, link_to: @slide_show.link_to }
    assert_redirected_to slide_show_path(assigns(:slide_show))
  end

  test "should destroy slide_show" do
    assert_difference('SlideShow.count', -1) do
      delete :destroy, id: @slide_show
    end

    assert_redirected_to slide_shows_path
  end
end
