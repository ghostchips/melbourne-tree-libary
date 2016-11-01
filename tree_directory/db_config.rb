
require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'treelibrary',
}

ActiveRecord::Base.establish_connection(options)
