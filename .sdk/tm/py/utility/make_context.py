# BizFactory SDK utility: make_context

from core.context import BizFactoryContext


def make_context_util(ctxmap, basectx):
    return BizFactoryContext(ctxmap, basectx)
