require 'rest-client'
require 'json'
module Learn
    class Challenge
        def self.take(challenge_name, settings)

            response = RestClient.post("#{Learn::HOST}/students/#{settings["id"]}/challenges/#{challenge_name}/take", {})

            json_response = JSON.parse(response)

            settings["current_challenge"] = json_response["current_challenge"]
            settings["current_task"] = json_response["current_task"]

            Learn.write_settings(settings)
        end
    end
end
