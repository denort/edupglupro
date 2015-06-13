require 'test_helper'

class ClippedFilesControllerTest < ActionController::TestCase
  setup do
    @clipped_file = clipped_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clipped_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clipped_file" do
    assert_difference('ClippedFile.count') do
      post :create, clipped_file: { lecture_id: @clipped_file.lecture_id, name: @clipped_file.name }
    end

    assert_redirected_to clipped_file_path(assigns(:clipped_file))
  end

  test "should show clipped_file" do
    get :show, id: @clipped_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clipped_file
    assert_response :success
  end

  test "should update clipped_file" do
    patch :update, id: @clipped_file, clipped_file: { lecture_id: @clipped_file.lecture_id, name: @clipped_file.name }
    assert_redirected_to clipped_file_path(assigns(:clipped_file))
  end

  test "should destroy clipped_file" do
    assert_difference('ClippedFile.count', -1) do
      delete :destroy, id: @clipped_file
    end

    assert_redirected_to clipped_files_path
  end
end
