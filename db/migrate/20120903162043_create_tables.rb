class CreateTables < ActiveRecord::Migration
  def up
    create_table :tables do |t|
      t.string :text
    end
  end

  def down
    drop_table :tables
  end
end
