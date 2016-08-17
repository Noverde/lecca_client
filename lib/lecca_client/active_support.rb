require 'active_support/inflector/transliterate'
require 'active_support/core_ext/string'
require 'active_support/core_ext/time/calculations'

Time.zone ||= LeccaClient.config.timezone
