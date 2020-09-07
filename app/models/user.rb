class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, :password, :password_confirmation
    validates_uniqueness_of :email

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

    has_many :skills, class_name: 'Skill', dependent: :destroy

    after_create :setDefaultValues

   
    def setDefaultValues
        defaultSkills=["Harmony", "Rhythm", "Improvisation", "Scales", "Arpeggios", "Ear training"]
        userDefaultSkills = []
        defaultSkills.each do |ds|
            newSkill = Skill.create!(user_id: self.id, name: ds)
            userDefaultSkills.push(newSkill)
            Measure.create!(skill_id: newSkill.id)
        end
    end

    def self.getScores(userId)
        Skill.joins(:measures).select('SUM(score) as total').where(user_id: userId )
    end
end