require 'test_helper'

class SendingMailerTest < ActionMailer::TestCase
  test "new_mail" do
    mail = SendingMailer.new_mail
    assert_equal "New mail", mail.subject
    assert_equal ["rk.ramakrishna11@gmail.com"], mail.to
    assert_equal ["rk.ramakrishna11@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
