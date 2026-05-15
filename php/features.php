<?php
declare(strict_types=1);

// BizFactory SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class BizFactoryFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BizFactoryBaseFeature();
            case "test":
                return new BizFactoryTestFeature();
            default:
                return new BizFactoryBaseFeature();
        }
    }
}
