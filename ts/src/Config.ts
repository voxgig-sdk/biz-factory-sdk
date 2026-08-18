
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'BizFactory',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://api.telegram.org",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      group: {
      },

    }
  }


  entity = {
    "group": {
      "fields": [
        {
          "name": "description",
          "type": "`$STRING`"
        },
        {
          "name": "groupName",
          "type": "`$STRING`"
        },
        {
          "name": "inviteLink",
          "type": "`$STRING`"
        },
        {
          "name": "memberCount",
          "type": "`$INTEGER`"
        },
        {
          "name": "resources",
          "type": "`$ARRAY`"
        }
      ],
      "name": "group",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/group/info",
              "parts": [
                "group",
                "info"
              ],
              "select": {
                "$action": "info"
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.resources`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

