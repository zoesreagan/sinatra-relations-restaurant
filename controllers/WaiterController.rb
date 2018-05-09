class WaiterController < ApplicationController


  get '/' do
    @waiters = Waiter.all
    @waiters.to_json
  end

  #this will get orders for a waiter
  get '/:id/orders' do
    w = Waiter.find params[:id]
    # binding.pry
    this_waiter_orders = w.orders
    {
      success: true,
      message: "Found #{this_waiter_orders.length} orders for #{w.name}",
      orders: this_waiter_orders
    }.to_json
  end

  #what orders are still open
  #how many orders is a waiter waiting for
  #what if we modified the orders table? How many items were ordered by waiter's guests?
  get '/:id/menuitems' do
    w = Waiter.find params[:id]
    {
      success: true,
      page_title: "menu items for #{w.name}",
      items: w.menu_items
    }.to_json
  end



  post '/' do
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    @waiter = Waiter.new
    @waiter.name = payload[:name]
    @waiter.save
    @waiter.to_json
  end

  put '/:id' do
    payload_body = request.body.read
    @payload = JSON.parse(payload_body).symbolize_keys

    @waiter = Waiter.find params[:id]
    @waiter.name = payload[:name]
    @waiter.save
    @waiter.to_json
  end

  delete '/:id' do
    @waiter = Waiter.find params[:id]
    @waiter.destroy
    {
      success: true,
      message: "waiter #{@waiter.name} deleted"
    }.to_json
  end

end
