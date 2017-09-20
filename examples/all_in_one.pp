# This example uses the defaults for all of the classes
# and configures them on a single machine. This kind of
# configuration would probably be used for a dev server
# or similar pre-production installation.

include custom_webapp::web
include custom_webapp::app
include custom_webapp::db
