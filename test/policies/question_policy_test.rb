require 'test_helper'

class QuestionPolicyTest < ActiveSupport::TestCase
  # def test_scope
  # end

  # def test_show
  # end

  # def test_create
  # end

  # def test_update
  # end

  # def test_destroy
  # end

  setup do
    @policy = Pundit.policy! users(:one), questions(:one)
  end

  test "cannot vote question if the user themselves created the question" do
    
  end
end
