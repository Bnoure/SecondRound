class AddColumntoUser < ActiveRecord::Migration[7.1]
  def change
    [:first_name,:last_name].each do |attribute|
      add_column :users , attribute , :string
    end
    add_column :users, :role, :integer
  end
end
