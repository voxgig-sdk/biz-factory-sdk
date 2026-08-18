-- BizFactory SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "BizFactory",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.telegram.org",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["group"] = {},
      },
    },
    entity = {
      ["group"] = {
        ["fields"] = {
          {
            ["name"] = "description",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "groupName",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "inviteLink",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "memberCount",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "resources",
            ["type"] = "`$ARRAY`",
          },
        },
        ["name"] = "group",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/group/info",
                ["parts"] = {
                  "group",
                  "info",
                },
                ["select"] = {
                  ["$action"] = "info",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.resources`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
