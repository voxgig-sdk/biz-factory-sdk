<?php
declare(strict_types=1);

// BizFactory SDK exists test

require_once __DIR__ . '/../bizfactory_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = BizFactorySDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
