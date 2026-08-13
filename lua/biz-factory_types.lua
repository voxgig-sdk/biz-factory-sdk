-- Typed models for the BizFactory SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Group
---@field description? string
---@field groupName? string
---@field inviteLink? string
---@field memberCount? number
---@field resources? table

---@class GroupListMatch
---@field description? string
---@field groupName? string
---@field inviteLink? string
---@field memberCount? number
---@field resources? table

local M = {}

return M
