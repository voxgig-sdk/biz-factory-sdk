# Typed models for the BizFactory SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Group:
    description: Optional[str] = None
    group_name: Optional[str] = None
    invite_link: Optional[str] = None
    member_count: Optional[int] = None
    resource: Optional[list] = None


@dataclass
class GroupListMatch:
    description: Optional[str] = None
    group_name: Optional[str] = None
    invite_link: Optional[str] = None
    member_count: Optional[int] = None
    resource: Optional[list] = None

