# frozen_string_literal: true

# Typed models for the BizFactory SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Group entity data model.
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] groupName
#   @return [String, nil]
#
# @!attribute [rw] inviteLink
#   @return [String, nil]
#
# @!attribute [rw] memberCount
#   @return [Integer, nil]
#
# @!attribute [rw] resources
#   @return [Array, nil]
Group = Struct.new(
  :description,
  :groupName,
  :inviteLink,
  :memberCount,
  :resources,
  keyword_init: true
)

# Request payload for Group#list.
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] groupName
#   @return [String, nil]
#
# @!attribute [rw] inviteLink
#   @return [String, nil]
#
# @!attribute [rw] memberCount
#   @return [Integer, nil]
#
# @!attribute [rw] resources
#   @return [Array, nil]
GroupListMatch = Struct.new(
  :description,
  :groupName,
  :inviteLink,
  :memberCount,
  :resources,
  keyword_init: true
)

