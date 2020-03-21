# frozen_string_literal: true

config_file = File.join(Rails.root, 'config/redis.yml')
REDIS_CONF = YAML.load_file(config_file)[Rails.env]

REDIS = Redis.new(
  host: REDIS_CONF['host'],
  port: REDIS_CONF['port'],
  db: 15
)
