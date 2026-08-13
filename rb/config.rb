# BizFactory SDK configuration

module BizFactoryConfig
  def self.make_config
    {
      "main" => {
        "name" => "BizFactory",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.telegram.org",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "group" => {},
        },
      },
      "entity" => {
        "group" => {
          "fields" => [
            {
              "active" => true,
              "name" => "description",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "groupName",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "inviteLink",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "memberCount",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "resources",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 4,
            },
          ],
          "name" => "group",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/group/info",
                  "parts" => [
                    "group",
                    "info",
                  ],
                  "select" => {
                    "$action" => "info",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.resources`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    BizFactoryFeatures.make_feature(name)
  end
end
