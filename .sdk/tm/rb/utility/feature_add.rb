# BizFactory SDK utility: feature_add
module BizFactoryUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
