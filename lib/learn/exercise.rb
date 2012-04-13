require 'rest-client'
require 'json'
require 'term/ansicolor'

module Learn
    class Exercise
        extend Term::ANSIColor

        def self.submit(name, contents)
          settings = Learn.read_settings
          begin
            legal_name = name.match(/ex(?<order>\d+)/)
            if legal_name
              response = RestClient.post(
                "#{Learn::HOST}/students/#{settings["account_number"].chomp}/exercises.json",
               {exercise: {name: name, contents: contents, ordering: legal_name[:order]}})
               print green, "Exercise #{legal_name[:order]} submitted successfully", reset, "\n"
            end
          rescue Exception => e
            puts e
            print red, "Exercise could not be submitted :(", reset, "\n"
          end
        end
    end
end
