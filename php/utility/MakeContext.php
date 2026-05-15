<?php
declare(strict_types=1);

// BizFactory SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class BizFactoryMakeContext
{
    public static function call(array $ctxmap, ?BizFactoryContext $basectx): BizFactoryContext
    {
        return new BizFactoryContext($ctxmap, $basectx);
    }
}
