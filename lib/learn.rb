require "learn/version"
require 'learn/student'
require 'learn/exercise'
require 'learn/cli'

module Learn
    HOST = "http://aprenderuby.herokuapp.com"
    SETTINGS_PATH = "#{Dir.home}/.learn"

    def self.write_settings(settings_hash)
        File.open(Learn::SETTINGS_PATH, 'w') do |f|
            f.write(settings_hash)
        end
        settings_hash
    end

    def self.read_settings
        settings = JSON.parse File.read(Learn::SETTINGS_PATH)
    end
end
