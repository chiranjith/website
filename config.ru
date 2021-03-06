require_relative 'apps/dynamic/reference'

Dir['apps/*'].each do |path|
  require_relative path + '/app'
end

if ENV['ROLLBAR_ACCESS_TOKEN']
  require 'rollbar'
  Rollbar.configure do |config|
    config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']
  end
end

use Static::App
use Api::App
use LegacyCukesInfo::App
use CucumberEclipse::App
use Dynamic::App
use Docs::App
use Modern::App
run Modern::NotFound
