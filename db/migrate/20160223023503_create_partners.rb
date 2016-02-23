class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :image_url

      t.timestamps null: false
    end
  end
end
