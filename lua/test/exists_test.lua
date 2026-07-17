-- BizFactory SDK exists test

local sdk = require("biz-factory_sdk")

describe("BizFactorySDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
