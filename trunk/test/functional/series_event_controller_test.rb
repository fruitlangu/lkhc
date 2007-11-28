require File.dirname(__FILE__) + '/../test_helper'
require 'series_event_controller'

# Re-raise errors caught by the controller.
class SeriesEventController; def rescue_action(e) raise e end; end

class SeriesEventControllerTest < Test::Unit::TestCase
  fixtures :series_events

  def setup
    @controller = SeriesEventController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = series_events(:first).id
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

    assert_not_nil assigns(:series_events)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:series_event)
    assert assigns(:series_event).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:series_event)
  end

  def test_create
    num_series_events = SeriesEvent.count

    post :create, :series_event => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_series_events + 1, SeriesEvent.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:series_event)
    assert assigns(:series_event).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      SeriesEvent.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      SeriesEvent.find(@first_id)
    }
  end
end
