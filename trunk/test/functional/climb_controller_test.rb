require File.dirname(__FILE__) + '/../test_helper'
require 'climb_controller'

# Re-raise errors caught by the controller.
class ClimbController; def rescue_action(e) raise e end; end

class ClimbControllerTest < Test::Unit::TestCase
  fixtures :climbs

  def setup
    @controller = ClimbController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = climbs(:first).id
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

    assert_not_nil assigns(:climbs)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:climb)
    assert assigns(:climb).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:climb)
  end

  def test_create
    num_climbs = Climb.count

    post :create, :climb => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_climbs + 1, Climb.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:climb)
    assert assigns(:climb).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Climb.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Climb.find(@first_id)
    }
  end
end
