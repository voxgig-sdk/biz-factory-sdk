// Typed models for the BizFactory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Group {
  description?: string
  group_name?: string
  invite_link?: string
  member_count?: number
  resource?: any[]
}

export type GroupListMatch = Partial<Group>

