class CreateDefaultSkillMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :default_skill_measures do |t|
      t.references :user, null: false, foreign_key: true
      t.references :default_skills, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
