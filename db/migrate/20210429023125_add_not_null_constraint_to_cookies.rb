class AddNotNullConstraintToCookies < ActiveRecord::Migration[5.1]
  def change
    change_column_null :cookies, :cooked, false, true
  end
end
