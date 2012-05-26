= RACK middleware:

== SignedRequest

Parses the Facebook signed requests into the RACK environment.
Currently doesn't validate the request signature.

== MethodFix

Corrects Facebook POST to GET for signed requests.

== LikeGate [url]

Redirects users to the specified like gate URL if they haven't liked the page.

SignedRequest should always come first in the chain, all the other middleware depends on the environment changes it makes.

Copyright 2012 Initforthe Ltd