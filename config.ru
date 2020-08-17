require './config/environment.rb'

use Rack::MethodOverride
use ReviewsController
use UsersController
use ParksController
run ApplicationController