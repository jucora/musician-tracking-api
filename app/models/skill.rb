class Skill < ApplicationRecord
    validates_presence_of :name, :user_id
    has_many :measures, class_name: 'Measure', dependent: :destroy
    belongs_to :user
end