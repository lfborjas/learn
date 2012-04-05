require 'rest-client'
require 'json'
module Learn
    class Student
        def self.register(email)
            begin
                response = RestClient.post(
                    "#{Learn::HOST}/students",
                    JSON.dump(student: {email: email}),
                    content_type: :json
                )

                File.open(Learn::SETTINGS_PATH, 'w') do |f|
                    f.write(response)
                end
            rescue Exception => e
                puts "Couldn't register because of #{e}"
            end
        end
    end
end
