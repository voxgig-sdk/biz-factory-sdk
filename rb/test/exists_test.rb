# BizFactory SDK exists test

require "minitest/autorun"
require_relative "../BizFactory_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = BizFactorySDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
