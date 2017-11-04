class AddSubscriberAndStripeIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :subscribed, :boolean
    add_column :users, :stripedid, :string
  end
end
