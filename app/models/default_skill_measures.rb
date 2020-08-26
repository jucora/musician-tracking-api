class DefaultSkillMeasures < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :default_skills, class_name: 'DefaultSkills'

  validates_presence_of :user_id
  validates_presence_of :default_skills_id
end
