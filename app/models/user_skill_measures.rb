class UserSkillMeasures < ApplicationRecord
  belongs_to :user_skills, class_name: 'UserSkills'
end
