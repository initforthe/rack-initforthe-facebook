# RACK middleware:

## SignedRequest

Parses the Facebook signed requests into the RACK environment.
Currently doesn't validate the request signature.

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