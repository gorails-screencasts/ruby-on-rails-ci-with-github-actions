class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.integer :score

      t.timestamps
    end
  end
end
