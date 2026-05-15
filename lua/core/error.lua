-- BizFactory SDK error

local BizFactoryError = {}
BizFactoryError.__index = BizFactoryError


function BizFactoryError.new(code, msg, ctx)
  local self = setmetatable({}, BizFactoryError)
  self.is_sdk_error = true
  self.sdk = "BizFactory"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function BizFactoryError:error()
  return self.msg
end


function BizFactoryError:__tostring()
  return self.msg
end


return BizFactoryError
