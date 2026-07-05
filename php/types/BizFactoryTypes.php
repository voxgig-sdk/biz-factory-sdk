<?php
declare(strict_types=1);

// Typed models for the BizFactory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Group entity data model. */
class Group
{
    public ?string $description = null;
    public ?string $group_name = null;
    public ?string $invite_link = null;
    public ?int $member_count = null;
    public ?array $resource = null;
}

/** Request payload for Group#list. */
class GroupListMatch
{
    public ?string $description = null;
    public ?string $group_name = null;
    public ?string $invite_link = null;
    public ?int $member_count = null;
    public ?array $resource = null;
}

