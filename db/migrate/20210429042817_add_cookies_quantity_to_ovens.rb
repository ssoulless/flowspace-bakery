class AddCookiesQuantityToOvens < ActiveRecord::Migration[5.1]
  def change
    add_column :ovens, :cookies_quantity, :int
  end
end
