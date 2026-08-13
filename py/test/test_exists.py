# BizFactory SDK exists test

import pytest
from bizfactory_sdk import BizFactorySDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = BizFactorySDK.test(None, None)
        assert testsdk is not None
