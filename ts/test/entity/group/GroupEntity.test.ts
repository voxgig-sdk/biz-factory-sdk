

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { BizFactorySDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('GroupEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BIZ_FACTORY_TEST_LIVE=TRUE.
  afterEach(liveDelay('BIZ_FACTORY_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BizFactorySDK.test()
    const ent = testsdk.Group()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BIZ_FACTORY_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'group.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"description","req":false,"type":"`$STRING`","index$":0},{"active":true,"name":"groupName","req":false,"type":"`$STRING`","index$":1},{"active":true,"name":"inviteLink","req":false,"type":"`$STRING`","index$":2},{"active":true,"name":"memberCount","req":false,"type":"`$INTEGER`","index$":3},{"active":true,"name":"resources","req":false,"type":"`$ARRAY`","index$":4}],"name":"group","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{},"contract":{"id":"GET /group/info","json":"{\"operationId\":\"getGroupInfo\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"description\":{\"example\":\"A Telegram group dedicated to sharing paid methods, APIs, tricks, scripts, and coding resources\",\"type\":\"string\"},\"groupName\":{\"example\":\"BIZ FACTORY\",\"type\":\"string\"},\"inviteLink\":{\"example\":\"https://t.me/+NaATB64x9z4zNTZl\",\"type\":\"string\"},\"memberCount\":{\"example\":1000,\"type\":\"integer\"},\"resources\":{\"example\":[\"Paid methods\",\"APIs\",\"Tricks\",\"Scripts\",\"Coding resources\"],\"items\":{\"type\":\"string\"},\"type\":\"array\"}},\"type\":\"object\"}}},\"description\":\"Successful response with group information\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"example\":\"Group not found\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Group not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"example\":\"Internal server error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/group/info","segments":[{"lit":"group"},{"lit":"info"}],"select":{"$action":"info"},"transform":{"req":"`reqdata`","res":"`body.resources`"},"index$":0}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"group","name__orig":"group","Name":"Group","name_":"group","name-":"group","NAME":"GROUP","index$":0}, {"active":true,"entity":"group","key$":"BasicGroupFlow","kind":"basic","name":"BasicGroupFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"group_ref01"}}],"index$":0}]}, 'Group')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let group_ref01_data = Object.values(setup.data.existing.group)[0] as any

    // LIST
    const group_ref01_ent = client.Group()
    const group_ref01_match: any = {}

    const group_ref01_list = (await group_ref01_ent.list(group_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/group/GroupTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = BizFactorySDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['group01','group02','group03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BIZ_FACTORY_TEST_GROUP_ENTID': idmap,
    'BIZ_FACTORY_TEST_LIVE': 'FALSE',
    'BIZ_FACTORY_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BIZ_FACTORY_TEST_GROUP_ENTID']

  const live = 'TRUE' === env.BIZ_FACTORY_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BIZ_FACTORY_TEST_GROUP_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new BizFactorySDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BIZ_FACTORY_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
