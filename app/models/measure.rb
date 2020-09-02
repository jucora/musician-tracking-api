class Measure < ApplicationRecord
    belongs_to :skill, class_name: 'Skill'
    validates_presence_of :score, :skill_id
    validates :score, numericality: { only_integer: true }
end