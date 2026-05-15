# BizFactory SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module BizFactoryFeatures
  def self.make_feature(name)
    case name
    when "base"
      BizFactoryBaseFeature.new
    when "test"
      BizFactoryTestFeature.new
    else
      BizFactoryBaseFeature.new
    end
  end
end
