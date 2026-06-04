# BizFactory SDK

Community Telegram group sharing paid methods, APIs, scripts, and coding resources

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About BIZ FACTORY

BIZ FACTORY is a Telegram community catalogued on [Free Public APIs](https://freepublicapis.com/biz-factory) rather than a structured HTTP API in its own right. The group is dedicated to sharing paid methods, APIs, tricks, scripts, and coding resources contributed by its members.

What's actually available through this listing:

- Access to the Telegram group itself, where members post links, scripts, and discussion.
- A single sample endpoint documented on the catalogue page — a Facebook video downloader that takes a Facebook URL and returns a downloadable video resource.
- No published schema, authentication scheme, or rate-limit policy beyond what is shown on the catalogue page.

The `server` value `https://api.telegram.org` reflects that the community lives on Telegram's platform; programmatic interaction would go through the standard Telegram Bot API, not a bespoke BIZ FACTORY service. The catalogue page reports CORS disabled and a 100% health score over the prior 30 days at the time of listing.

## Try it

**TypeScript**
```bash
npm install biz-factory
```

**Python**
```bash
pip install biz-factory-sdk
```

**PHP**
```bash
composer require voxgig/biz-factory-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/biz-factory-sdk/go
```

**Ruby**
```bash
gem install biz-factory-sdk
```

**Lua**
```bash
luarocks install biz-factory-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { BizFactorySDK } from 'biz-factory'

const client = new BizFactorySDK({})

// List all groups
const groups = await client.Group().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o biz-factory-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "biz-factory": {
      "command": "/abs/path/to/biz-factory-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Group** | Represents the BIZ FACTORY Telegram group itself — a member-driven channel for sharing paid methods, APIs, scripts, and coding resources rather than a structured REST resource. | `/group/info` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from bizfactory_sdk import BizFactorySDK

client = BizFactorySDK({})

# List all groups
groups, err = client.Group(None).list(None, None)
```

### PHP

```php
<?php
require_once 'bizfactory_sdk.php';

$client = new BizFactorySDK([]);

// List all groups
[$groups, $err] = $client->Group(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/biz-factory-sdk/go"

client := sdk.NewBizFactorySDK(map[string]any{})

// List all groups
groups, err := client.Group(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "BizFactory_sdk"

client = BizFactorySDK.new({})

# List all groups
groups, err = client.Group(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("biz-factory_sdk")

local client = sdk.new({})

-- List all groups
local groups, err = client:Group(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = BizFactorySDK.test()
const result = await client.Group().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = BizFactorySDK.test(None, None)
result, err = client.Group(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = BizFactorySDK::test(null, null);
[$result, $err] = $client->Group(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Group(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = BizFactorySDK.test(nil, nil)
result, err = client.Group(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Group(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the BIZ FACTORY

- Upstream: [https://freepublicapis.com/biz-factory](https://freepublicapis.com/biz-factory)

- No formal license is published for the BIZ FACTORY group or its shared resources.
- The group redistributes third-party paid methods, APIs, and scripts; redistribution rights for that material are not granted by this listing.
- Treat any code or tooling obtained through the group as use-at-your-own-risk and verify the upstream source's terms before relying on it.

---

Generated from the BIZ FACTORY OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
