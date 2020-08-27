class SkillsController < ApplicationController
    include CurrentUserConcern

    def index
        currentSkills = Skill.joins(:measures).select('skill_id, name, SUM(score)').group("name, skill_id").where(user_id: @current_user.id )
        if currentSkills
            render json: {
                status: :founded,
                currentSkills: currentSkills
            }
        else
            render json:{
                status: 500
            }
        end
    end

    def create
        newSkill = Skill.create!(name: params["newSkill"]["name"], user_id: @current_user.id)
        if newSkill
            newMeasure = Measure.create!(skill_id: newSkill.id)
            if newMeasure
                render json: {
                status: :created,
                newSkill: newSkill,
                newMeasure: newMeasure
            }
            end
        else
            render json:{
                status: false
            }
        end
    end

    
end