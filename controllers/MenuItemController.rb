class MenuItemController < ApplicationController

    get '/' do
      @menuitems = MenuItem.all
      @menuitems.to_json
    end

    ##this should get all orders for a menu item
    get '/:id/orders' do
      @menuitems.orders = Order.find params[:id]
    end

    post '/' do
      payload_body = request.body.read
      payload = JSON.parse(payload_body).symbolize_keys

      @menuitem = MenuItem.new
      @menuitem.name = payload[:name]
      @menuitem.save
      @waiter.to_json
    end

    put '/:id' do
      payload_body = request.body.read
      @payload = JSON.parse(payload_body).symbolize_keys

      @menuitem = MenuItem.find params[:id]
      @menuitem.name = payload[:name]
      @menuitem.save
      @menuitem.to_json
    end

    delete '/:id' do
      @menuitem = MenuItem.find params[:id]
      @menuitem.destroy
      {
        success: true,
        message: "menu item #{@menuitem.name} deleted"
      }.to_json
    end

  end
