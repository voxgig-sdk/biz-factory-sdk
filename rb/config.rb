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
              "name" => "group_name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "invite_link",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "member_count",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "resource",
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
                    "res" => "`body`",
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
