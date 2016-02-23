class AddManufacturerIdToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :manufacturer_id, :integer
  end
end
