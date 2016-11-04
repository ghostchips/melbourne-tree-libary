#
require 'active_record'
#
options = {
  adapter: 'postgresql',
  database: 'treelibrary',
}
#
# ActiveRecord::Base.establish_connection(options)
#
# comment out ^ and un-comment below before sending to Heroku
ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
