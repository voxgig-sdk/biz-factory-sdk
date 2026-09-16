# BizFactory SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module BizFactoryFeatures
  def self.make_feature(name)
    case name
    when "base"
      BizFactoryBaseFeature.new
    when "ratelimit"
      BizFactoryRatelimitFeature.new
    when "retry"
      BizFactoryRetryFeature.new
    when "test"
      BizFactoryTestFeature.new
    when "timeout"
      BizFactoryTimeoutFeature.new
    else
      BizFactoryBaseFeature.new
    end
  end
end
