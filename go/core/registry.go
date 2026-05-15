package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewGroupEntityFunc func(client *BizFactorySDK, entopts map[string]any) BizFactoryEntity

