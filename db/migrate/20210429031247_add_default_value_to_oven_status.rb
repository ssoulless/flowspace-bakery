class AddDefaultValueToOvenStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :ovens, :status, :string, default: 'empty'
  end
end
