# BizFactory SDK configuration


def make_config():
    return {
        "main": {
            "name": "BizFactory",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.telegram.org",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "group": {},
            },
        },
        "entity": {
      "group": {
        "fields": [
          {
            "active": True,
            "name": "description",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "groupName",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "inviteLink",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "memberCount",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "resources",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 4,
          },
        ],
        "name": "group",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/group/info",
                "parts": [
                  "group",
                  "info",
                ],
                "select": {
                  "$action": "info",
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.resources`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
