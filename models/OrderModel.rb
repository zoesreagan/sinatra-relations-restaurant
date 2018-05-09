class Order < ActiveRecord::Base
  belongs_to :waiter
  belongs_to :menu_item
end
