require 'sequel'
require 'dotenv'

Dotenv.load

unless ENV.fetch('RACK_ENV') == 'test'
  DB = Sequel.connect(ENV.fetch('DATABASE_URL'))
else
  DB = Sequel.connect(ENV.fetch('TEST_DATABASE_URL'))
end

Dir['./lib/models/*.rb'].each { |file| require file }

