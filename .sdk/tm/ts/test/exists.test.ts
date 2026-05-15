
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BizFactorySDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BizFactorySDK.test()
    equal(null !== testsdk, true)
  })

})
