class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :card_id
      t.string :name
      t.integer :blood
      t.date :birth
      t.integer :sex
      t.integer :opt_type

      t.timestamps
    end
  end
end
