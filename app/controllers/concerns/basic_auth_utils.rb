module Concerns
  module BasicAuthUtils
    extend ActiveSupport::Concern
    
    included do
      if ENV['BASIC_AUTH_LOGIN'].present?
        http_basic_authenticate_with name: ENV['BASIC_AUTH_LOGIN'], password: ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
