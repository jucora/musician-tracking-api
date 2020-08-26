class UserSkillsController < ApplicationController
    include CurrentUserConcern
    def index
        userSkills = UserSkills.left_outer_joins(:user_skill_measures).select('name, score').where(user_id: @current_user.id)
        if userSkills
            render json: {
                status: :founded,
                userSkills: userSkills
            }
        else
            render json:{
                status: 500
            }
        end
    end


    def create
        newSkill = UserSkills.create!(
            
            user_id: params["newSkill"]["user_id"],
            name: params["newSkill"]["name"], 
        )
        if newSkill
            render json: {
                status: :created,
                newSkill: newSkill
            }
        else
            render json:{
                status: 500
            }
        end
    end
end