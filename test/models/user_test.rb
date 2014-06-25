require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "a user should enter valid data" do
    user = User.new
    
    assert !user.save
    assert !user.errors[:first_name].empty?
    assert !user.errors[:last_name].empty?
    assert !user.errors[:profile_name].empty?
  end

  test "user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:bobdylan).profile_name

    assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user should have profile name without spaces" do
    user = User.new
    user.profile_name = "Bob Dylan"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("must contains use only letters, '-' or '_'.")
  end

end
