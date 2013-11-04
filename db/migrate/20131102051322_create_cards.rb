class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :unique_str

      t.timestamps
    end
  end
end
