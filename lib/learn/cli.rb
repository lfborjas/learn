require 'json'

module Learn
    class CLI 
        def self.start
            #if the file doesn't exist, create it
            unless File.exists?(Learn::SETTINGS_PATH)
                puts "Hi! It's time to register, this should only happen once!"
                email = gets
                Learn::Student.register(email)
            else 
                #it does exist, if we have command line arguments and they're a file
                #then this is a response to the challenge, if not, just wanting to check
                settings = JSON.parse File.read(Learn::SETTINGS_PATH)
                puts settings

                if ARGV.length == 0
                    Learn::Challenge.check(settings)
                else
                    Learn::Challenge.solve(settings, File.new(ARGV[0]))
                end
            end
        end
    end
end
