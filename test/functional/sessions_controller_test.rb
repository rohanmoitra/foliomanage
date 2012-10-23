require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    @input = {
              name: 'dave',
              hashed_password: 'secret',
              salt: 'MyString'
    }
  end
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should login" do
    dave = users(:one)
    post :create, :user => @input
    assert_equal dave.id, session[:user_id]
  end

  test "should fail login" do
    dave = users(:one)
    post :create, :user => @input
  end


end
