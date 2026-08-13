// Typed models for the BizFactory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Group {
  description?: string
  groupName?: string
  inviteLink?: string
  memberCount?: number
  resources?: any[]
}

export interface GroupListMatch {
  description?: string
  groupName?: string
  inviteLink?: string
  memberCount?: number
  resources?: any[]

  // Selects a custom action instead of the plain list:
  //   'info'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

