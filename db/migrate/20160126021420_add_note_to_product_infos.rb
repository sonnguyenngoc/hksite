class AddNoteToProductInfos < ActiveRecord::Migration
  def change
    add_column :product_infos, :note, :text
  end
end
