require File.dirname(__FILE__) + '/../../test_helper'
require 'user/login_controller'

# Re-raise errors caught by the controller.
class User::LoginController; def rescue_action(e) raise e end; end

class User::LoginControllerTest < Test::Unit::TestCase
  def setup
    @controller = User::LoginController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
