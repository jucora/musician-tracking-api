class UserSkills < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :user_skill_measures, class_name: 'UserSkillMeasures'
end
