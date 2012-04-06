require 'json'
require 'term/ansicolor'

module Learn
    class CLI 
        extend Term::ANSIColor
        def self.start
            #if the file doesn't exist, create it
            unless File.exists?(Learn::SETTINGS_PATH)
                print green, "Hi! It's time to register, this should only happen once!",reset
                print "\nEmail: "

                challenge_name = ARGV.pop

                email = gets
                if Learn::Student.register(email)
                    print green, "Done. Getting your fist challenge...", reset, "\n"
                    settings = Learn.read_settings
                    if (res = Learn::Challenge.take(challenge_name, settings))
                        print green, "Ok, your first task is", reset,"\n"
                        print res[:content]
                    else
                    end
                else
                    print red, "Couldn't register, check your internet collection and try again", reset
                end
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
