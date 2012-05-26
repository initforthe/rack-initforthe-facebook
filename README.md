RACK middleware to:

* Parse the Facebook signed requests into the RACK environment.
* Correct Facebook POST to GET for signed requests.

Currently doesn't validate the request signature.

The MethodFix middleware relies on the SignedRequest middleware. SignedRequest should be before MethodFix in the chain.

Copyright 2012 Initforthe Ltd