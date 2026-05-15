
import { Context } from './Context'


class BizFactoryError extends Error {

  isBizFactoryError = true

  sdk = 'BizFactory'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  BizFactoryError
}

