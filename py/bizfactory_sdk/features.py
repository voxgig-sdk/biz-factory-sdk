# BizFactory SDK feature factory

from bizfactory_sdk.feature.base_feature import BizFactoryBaseFeature
from bizfactory_sdk.feature.ratelimit_feature import BizFactoryRatelimitFeature
from bizfactory_sdk.feature.retry_feature import BizFactoryRetryFeature
from bizfactory_sdk.feature.test_feature import BizFactoryTestFeature
from bizfactory_sdk.feature.timeout_feature import BizFactoryTimeoutFeature


_FEATURES = {
    "base": lambda: BizFactoryBaseFeature(),
    "ratelimit": lambda: BizFactoryRatelimitFeature(),
    "retry": lambda: BizFactoryRetryFeature(),
    "test": lambda: BizFactoryTestFeature(),
    "timeout": lambda: BizFactoryTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
