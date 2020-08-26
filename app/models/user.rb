class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email
    validates_uniqueness_of :email

    has_many :default_skill_measures, class_name: 'DefaultSkillMeasures'
    has_many :default_skills, through: :default_skill_measures

    has_many :user_skills, class_name: 'UserSkills'
end