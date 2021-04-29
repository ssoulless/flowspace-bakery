class AddDefaultValueToCookedAttributeOfCookies < ActiveRecord::Migration[5.1]
  def change
    change_column :cookies, :cooked, :boolean, default: false
  end
end
