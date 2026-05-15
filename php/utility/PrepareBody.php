<?php
declare(strict_types=1);

// BizFactory SDK utility: prepare_body

class BizFactoryPrepareBody
{
    public static function call(BizFactoryContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
