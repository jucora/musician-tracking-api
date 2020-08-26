class DefaultScoreForDefaultSkillsMeasures < ActiveRecord::Migration[6.0]
  def change
    change_column :default_skill_measures, :score, :integer, :default => 0
  end
end
