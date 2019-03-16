class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :type
      t.string :url

      t.timestamps
    end
  end
end
