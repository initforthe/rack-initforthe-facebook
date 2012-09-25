# RACK middleware:

## SignedRequest

Parses a Facebook signed request or oauth cookie and stores it in the RACK environment.
In order to parse an fbsr_APP_ID cookie you'll need to pass the :app_id => X option to the middleware.
This option can be a lambda, in case you have the app ID stored in such a way that it's not available at rackup parsing time.

For example, if you are using rails_config, you might configure SignedRequest like so:

use Rack::Initforthe::Facebook::SignedRequest, app_id: -> { Settings.facebook.app_id }

Note: Currently the signature is not validated.

## MethodFix

Corrects Facebook POST to GET for signed requests.

## LikeGate [url]

Redirects users to the specified like gate URL if they haven't liked the page.

## AppDataRedirect

Redirects users to a path passed in via Facebook's app_data parameter. Useful for allowing users to Facebook share a link to content which doesn't live on the landing page of a tab application.

# Notes

SignedRequest should always come first in the chain, all the other middleware depends on the environment changes it makes.

# Credits

Copyright 2012 Initforthe Ltd