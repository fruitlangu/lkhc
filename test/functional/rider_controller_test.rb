require File.dirname(__FILE__) + '/../test_helper'
require 'rider_controller'

# Re-raise errors caught by the controller.
class RiderController; def rescue_action(e) raise e end; end

class RiderControllerTest < Test::Unit::TestCase
  fixtures :riders

  def setup
    @controller = RiderController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = riders(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:riders)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:rider)
    assert assigns(:rider).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:rider)
  end

  def test_create
    num_riders = Rider.count

    post :create, :rider => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_riders + 1, Rider.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:rider)
    assert assigns(:rider).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Rider.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Rider.find(@first_id)
    }
  end
end
