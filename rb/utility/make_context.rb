# BizFactory SDK utility: make_context
require_relative '../core/context'
module BizFactoryUtilities
  MakeContext = ->(ctxmap, basectx) {
    BizFactoryContext.new(ctxmap, basectx)
  }
end
