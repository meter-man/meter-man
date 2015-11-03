require 'test_helper'

class ReadingsControllerTest < ActionController::TestCase
  setup do
    @reading = readings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reading" do
    assert_difference('Reading.count') do
      post :create, reading: { reading: @reading.reading, reading_date: @reading.reading_date }
    end

    assert_redirected_to reading_path(assigns(:reading))
  end

  test "should show reading" do
    get :show, id: @reading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reading
    assert_response :success
  end

  test "should update reading" do
    patch :update, id: @reading, reading: { reading: @reading.reading, reading_date: @reading.reading_date }
    assert_redirected_to reading_path(assigns(:reading))
  end

  test "should destroy reading" do
    assert_difference('Reading.count', -1) do
      delete :destroy, id: @reading
    end

    assert_redirected_to readings_path
  end
end
