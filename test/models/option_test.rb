require "test_helper"

class OptionTest < ActiveSupport::TestCase
  test "should not save option without question" do
    option = options(:option)
    option.question = nil
    assert_not option.valid?, "Option isn't valid without question"
  end

  test "should not save option without option text" do
    option = options(:option)
    option.text = nil
    assert_not option.valid?, "Option isn't valid without option text"
  end

  test "should not save option without letter" do
    option = options(:option)
    option.letter = nil
    assert_not option.valid?, "Option isn't valid without option letter"
  end

  test "should save option with option text and letter" do
    option = options(:option)
    assert option.valid?, "Option is valid with option text and letter"
  end
end
