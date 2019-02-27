class AddAvatarToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :avatar, :string
  end
end
