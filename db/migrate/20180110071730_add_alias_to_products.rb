class AddAliasToProducts < ActiveRecord::Migration
  def change
    add_column :products, :alias, :string
  end
end
