require 'rest-client'
require 'json'
module Learn
    class Student
        def self.register(account_number)
            begin
                response = RestClient.post(
                    "#{Learn::HOST}/students",
                    JSON.dump(student: {account_number: account_number}),
                    content_type: :json
                )
                Learn.write_settings(response)
            rescue Exception => e
                puts "Couldn't register because of #{e}"
            end
        end
    end
end
