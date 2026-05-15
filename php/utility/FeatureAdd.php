<?php
declare(strict_types=1);

// BizFactory SDK utility: feature_add

class BizFactoryFeatureAdd
{
    public static function call(BizFactoryContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
