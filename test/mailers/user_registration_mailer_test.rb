require "test_helper"

class UserRegistrationMailerTest < ActionMailer::TestCase
  test "register_notification" do
    mail = UserRegistrationMailer.register_notification
    assert_equal "Register notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "login_notification" do
    mail = UserRegistrationMailer.login_notification
    assert_equal "Login notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
