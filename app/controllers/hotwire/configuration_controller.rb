module Hotwire
  class ConfigurationController < ApplicationController
    def ios_v1
      render json: {
        settings: {},
        rules: [
          {
            patterns: [
              "/new$",
              "/edit$"
            ],
            properties: {
              context: "modal"
            }
          }
        ]
      }
    end
  end
end
