# BizFactory SDK feature factory

from feature.base_feature import BizFactoryBaseFeature
from feature.test_feature import BizFactoryTestFeature


def _make_feature(name):
    features = {
        "base": lambda: BizFactoryBaseFeature(),
        "test": lambda: BizFactoryTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
