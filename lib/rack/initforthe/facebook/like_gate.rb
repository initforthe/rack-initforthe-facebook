module Rack
  module Initforthe
    module Facebook
      class LikeGate
        def initialize(app, url, options = {})
          @app = app
          @url = url
        end

        def call(env)
          signed_params = env['facebook.signed_request']
          if signed_params.nil? || page_liked?(signed_params)
            @app.call(env)
          else
            [301, { 'Location' => @url }, ['Please like the application']]
          end
        end

        private
        
        def page_liked?(signed_params)
          signed_params.try(:[], 'page').try(:[], 'liked') || false
        end
      end
    end
  end
end
