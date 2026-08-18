# BizFactory SDK configuration

module BizFactoryConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
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
              "name" => "description",
              "type" => "`$STRING`",
            },
            {
              "name" => "groupName",
              "type" => "`$STRING`",
            },
            {
              "name" => "inviteLink",
              "type" => "`$STRING`",
            },
            {
              "name" => "memberCount",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "resources",
              "type" => "`$ARRAY`",
            },
          ],
          "name" => "group",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
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
                },
              ],
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
