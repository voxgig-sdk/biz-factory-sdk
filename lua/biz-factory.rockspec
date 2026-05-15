package = "voxgig-sdk-biz-factory"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/biz-factory-sdk.git"
}
description = {
  summary = "BizFactory SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["biz-factory_sdk"] = "biz-factory_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
