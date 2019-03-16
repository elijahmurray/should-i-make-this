class AddStageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :stage, :string
  end
end
