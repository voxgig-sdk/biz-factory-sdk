<?php
declare(strict_types=1);

// BizFactory SDK configuration

class BizFactoryConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "BizFactory",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://api.telegram.org",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "group" => [],
                ],
            ],
            "entity" => [
        'group' => [
          'fields' => [
            [
              'name' => 'description',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'groupName',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'inviteLink',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'memberCount',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'resources',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'group',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/group/info',
                  'parts' => [
                    'group',
                    'info',
                  ],
                  'select' => [
                    '$action' => 'info',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.resources`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return BizFactoryFeatures::make_feature($name);
    }
}
