require 'test_helper'

class ComplexitiesControllerTest < ActionController::TestCase
  setup do
    @complexity = complexities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complexities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complexity" do
    assert_difference('Complexity.count') do
      post :create, complexity: { name: @complexity.name }
    end

    assert_redirected_to complexity_path(assigns(:complexity))
  end

  test "should show complexity" do
    get :show, id: @complexity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complexity
    assert_response :success
  end

  test "should update complexity" do
    patch :update, id: @complexity, complexity: { name: @complexity.name }
    assert_redirected_to complexity_path(assigns(:complexity))
  end

  test "should destroy complexity" do
    assert_difference('Complexity.count', -1) do
      delete :destroy, id: @complexity
    end

    assert_redirected_to complexities_path
  end
end
