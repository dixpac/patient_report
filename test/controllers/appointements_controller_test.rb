require 'test_helper'

class AppointementsControllerTest < ActionController::TestCase
  setup do
    @appointement = appointements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointement" do
    assert_difference('Appointement.count') do
      post :create, appointement: { description: @appointement.description, references: @appointement.references }
    end

    assert_redirected_to appointement_path(assigns(:appointement))
  end

  test "should show appointement" do
    get :show, id: @appointement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointement
    assert_response :success
  end

  test "should update appointement" do
    patch :update, id: @appointement, appointement: { description: @appointement.description, references: @appointement.references }
    assert_redirected_to appointement_path(assigns(:appointement))
  end

  test "should destroy appointement" do
    assert_difference('Appointement.count', -1) do
      delete :destroy, id: @appointement
    end

    assert_redirected_to appointements_path
  end
end
