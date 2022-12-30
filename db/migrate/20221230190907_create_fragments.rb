class CreateFragments < ActiveRecord::Migration[7.0]
  def change
    create_table :fragments do |t|
      t.string :element
      t.string :data
      t.integer :position
      t.string :meta

      t.timestamps
    end
  end
end
