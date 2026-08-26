
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

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'BizFactory',
        slug: "biz-factory",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      },
      "transport": "base"
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

