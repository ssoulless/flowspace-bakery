class AddStatusToOvens < ActiveRecord::Migration[5.1]
  def change
    add_column :ovens, :status, :string
  end
end
