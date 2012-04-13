require 'json'
require 'term/ansicolor'

module Learn
    class CLI 
        extend Term::ANSIColor
        def self.start
            filename = ARGV.pop

            #if the file doesn't exist, create it
            unless File.exists?(Learn::SETTINGS_PATH)
                print green, "Hi! It's time to register, this should only happen once!",reset
                print "\nAccount Number: "


                account_number= gets.chomp
                if Learn::Student.register(account_number)
                    print green, "Done, you're registered as a student", reset, "\n"
                else
                    print red, "Couldn't register, check your internet collection and try again", reset, "\n"
                end
            end

            if filename and File.exists?("./#{filename}")
              contents = File.read("./#{filename}")
              Learn::Exercise.submit(filename, contents)
            else
              print red,  "Usage: learn ex<exercise_number>.rb", reset, "\n"
            end
        end
    end
end
