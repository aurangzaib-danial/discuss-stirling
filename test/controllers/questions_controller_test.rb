require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    login_as @user
  end
  test "questioner automatically follows question when they create it" do
    params = {
      question: {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph,
        subject_id: subjects(:one).id,
      }
    }

    assert_difference "@user.followed_questions.count"  do
      post questions_path, params: params
    end
  end
end
