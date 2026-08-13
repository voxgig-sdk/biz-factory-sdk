# BizFactory SDK utility: make_context

from projectname_sdk.core.context import BizFactoryContext


def make_context_util(ctxmap, basectx):
    return BizFactoryContext(ctxmap, basectx)
