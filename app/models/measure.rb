class Measure < ApplicationRecord
    belongs_to :skill, class_name: 'Skill'
end