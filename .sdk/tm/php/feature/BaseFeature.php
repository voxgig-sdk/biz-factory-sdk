<?php
declare(strict_types=1);

// BizFactory SDK base feature

class BizFactoryBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(BizFactoryContext $ctx, array $options): void {}
    public function PostConstruct(BizFactoryContext $ctx): void {}
    public function PostConstructEntity(BizFactoryContext $ctx): void {}
    public function SetData(BizFactoryContext $ctx): void {}
    public function GetData(BizFactoryContext $ctx): void {}
    public function GetMatch(BizFactoryContext $ctx): void {}
    public function SetMatch(BizFactoryContext $ctx): void {}
    public function PrePoint(BizFactoryContext $ctx): void {}
    public function PreSpec(BizFactoryContext $ctx): void {}
    public function PreRequest(BizFactoryContext $ctx): void {}
    public function PreResponse(BizFactoryContext $ctx): void {}
    public function PreResult(BizFactoryContext $ctx): void {}
    public function PreDone(BizFactoryContext $ctx): void {}
    public function PreUnexpected(BizFactoryContext $ctx): void {}
}
