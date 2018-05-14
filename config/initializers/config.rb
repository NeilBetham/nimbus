# Setup config for app from yaml file
CONFIG = YAML.load(File.read(File.expand_path('./config/nimbus-config.yml')))
CONFIG.merge! CONFIG.fetch(Rails.env, {})
CONFIG.deep_symbolize_keys!
CONFIG.deep_freeze!
