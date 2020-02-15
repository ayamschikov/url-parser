# frozen_string_literal: true

# Migrate

migrate = lambda do |env, version|
  ENV['RACK_ENV'] = env
  require_relative 'db'
  require 'logger'
  Sequel.extension :migration
  DB.loggers << Logger.new($stdout) if DB.loggers.empty?
  Sequel::Migrator.apply(DB, 'migrate', version)
end

desc 'Create the database'
task :create do
  config = Sequel::Model.db.opts
  config[:charset] = 'utf8' unless config[:charset]
  puts "=> Creating database '#{config[:database]}'"
  create_db(config)
  puts '<= db:create executed'
end

desc 'Drop the database'
task :drop do
  Sequel::Model.db.disconnect
  config = Sequel::Model.db.opts
  puts "=> Dropping database '#{config[:database]}'"
  drop_db(config)
  puts '<= db:drop executed'
end

desc 'Migrate test database to latest version'
task :test_up do
  migrate.call('test', nil)
end

desc 'Migrate test database all the way down'
task :test_down do
  migrate.call('test', 0)
end

desc 'Migrate test database all the way down and then back up'
task :test_bounce do
  migrate.call('test', 0)
  Sequel::Migrator.apply(DB, 'migrate')
end

desc 'Migrate development database to latest version'
task :dev_up do
  migrate.call('development', nil)
end

desc 'Migrate development database to all the way down'
task :dev_down do
  migrate.call('development', 0)
end

desc 'Migrate development database all the way down and then back up'
task :dev_bounce do
  migrate.call('development', 0)
  Sequel::Migrator.apply(DB, 'migrate')
end

desc 'Migrate production database to latest version'
task :prod_up do
  migrate.call('production', nil)
end

# Shell

irb = proc do |env|
  ENV['RACK_ENV'] = env
  trap('INT', 'IGNORE')
  dir, base = File.split(FileUtils::RUBY)
  cmd = if base.sub!(/\Aruby/, 'irb')
          File.join(dir, base)
        else
          "#{FileUtils::RUBY} -S irb"
        end
  sh "#{cmd} -r ./models"
end

desc 'Open irb shell in test mode'
task :test_irb do
  irb.call('test')
end

desc 'Open irb shell in development mode'
task :dev_irb do
  irb.call('development')
end

desc 'Open irb shell in production mode'
task :prod_irb do
  irb.call('production')
end

def self.create_db(config)
  environment = {}
  environment['PGUSER']     = config[:user]
  environment['PGPASSWORD'] = config[:password]
  arguments = []
  arguments << "--encoding=#{config[:charset]}" if config[:charset]
  arguments << "--host=#{config[:host]}" if config[:host]
  arguments << "--username=#{config[:user]}" if config[:user]
  arguments << config[:database]
  Process.wait Process.spawn(environment, 'createdb', *arguments)
end

def self.drop_db(config)
  environment = {}
  environment['PGUSER']     = config[:user]
  environment['PGPASSWORD'] = config[:password]
  arguments = []
  arguments << "--host=#{config[:host]}" if config[:host]
  arguments << "--username=#{config[:user]}" if config[:user]
  arguments << config[:database]
  Process.wait Process.spawn(environment, 'dropdb', *arguments)
end

desc 'Run all specs'
task default: sh('rspec')
