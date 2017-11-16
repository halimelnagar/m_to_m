require 'test_helper'

class PhaseLevelsControllerTest < ActionController::TestCase
  setup do
    @phase_level = phase_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phase_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phase_level" do
    assert_difference('PhaseLevel.count') do
      post :create, phase_level: { name: @phase_level.name }
    end

    assert_redirected_to phase_level_path(assigns(:phase_level))
  end

  test "should show phase_level" do
    get :show, id: @phase_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phase_level
    assert_response :success
  end

  test "should update phase_level" do
    patch :update, id: @phase_level, phase_level: { name: @phase_level.name }
    assert_redirected_to phase_level_path(assigns(:phase_level))
  end

  test "should destroy phase_level" do
    assert_difference('PhaseLevel.count', -1) do
      delete :destroy, id: @phase_level
    end

    assert_redirected_to phase_levels_path
  end
end
