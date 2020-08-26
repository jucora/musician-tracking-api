class DefaultSkills < ApplicationRecord
    has_many :default_skill_measures, class_name: 'DefaultSkillMeasures'
    has_many :users, through: :default_skill_measures
end
