require 'test_helper'

class StatusTest < ActiveSupport::TestCase

  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a status's content has at lesast 3 letters" do
  	status = Status.new
  	status.content = "Hi"

  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a status has a user id" do
  	status = Status.new
  	status.content = "Hi!"
  	
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end

end
