class CreateMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :measures do |t|
      t.references :skill, null: false, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
