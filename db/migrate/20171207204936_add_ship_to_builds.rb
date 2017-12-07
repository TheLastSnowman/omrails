class AddShipToBuilds < ActiveRecord::Migration[5.1]
  def change
    add_column :builds, :ship, :string
  end
end
