module Rack
  module Initforthe
    module Facebook
      class SignedRequest
        def initialize(app, options = {})
          @app = app
          @options = options
        end

        def app_id
          @app_id ||= begin
            app_id = @options[:app_id]
            app_id.respond_to?(:call) ? app_id.call : app_id
          end
        end

        def call(env)
          request = Request.new(env)
          if !app_id.nil? && request.cookies["fbsr_#{app_id}"]
            env['facebook.signed_cookie'] = parse_signature(request.cookies["fbsr_#{app_id}"])
          end
          if request.params['signed_request']
            env['facebook.signed_request'] = parse_signature(request.params['signed_request'])
          end
          @app.call(env)
        end

        private

        def parse_signature(signed_request)
          signature, data = signed_request.split('.', 2)
          data << '=' while data.length % 4 > 0
          JSON.parse(Base64.urlsafe_decode64(data))
        end
      end
    end
  end
end
