require 'sinatra/base'
require 'sinatra/activerecord'

# controllers
require './controllers/ApplicationController'
require './controllers/WaiterController'
require './controllers/MenuItemController'

#models
require './models/WaiterModel'
require  './models/MenuItemModel'
require './models/OrderModel'

# routes
map('/') {
  run ApplicationController
}

map('/waiters') {
  run WaiterController
}

map('/menuitems'){
  run MenuItemController
}
