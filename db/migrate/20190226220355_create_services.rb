class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.belongs_to :institution, foreign_key: true
      t.belongs_to :doctor, foreign_key: true

      t.timestamps
    end
  end
end
