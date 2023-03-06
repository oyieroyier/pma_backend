class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :details, :string
  end
end
