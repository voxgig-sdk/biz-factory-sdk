package voxgigbizfactorysdk

import (
	"github.com/voxgig-sdk/biz-factory-sdk/go/core"
	"github.com/voxgig-sdk/biz-factory-sdk/go/entity"
	"github.com/voxgig-sdk/biz-factory-sdk/go/feature"
	_ "github.com/voxgig-sdk/biz-factory-sdk/go/utility"
)

// Type aliases preserve external API.
type BizFactorySDK = core.BizFactorySDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type BizFactoryEntity = core.BizFactoryEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type BizFactoryError = core.BizFactoryError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewGroupEntityFunc = func(client *core.BizFactorySDK, entopts map[string]any) core.BizFactoryEntity {
		return entity.NewGroupEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewBizFactorySDK = core.NewBizFactorySDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewBizFactorySDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *BizFactorySDK  { return NewBizFactorySDK(nil) }
func Test() *BizFactorySDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
