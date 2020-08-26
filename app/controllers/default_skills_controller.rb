class DefaultSkillsController < ApplicationController
    include CurrentUserConcern

    def index
        defaultSkills = DefaultSkillMeasures.joins(:default_skills).select('name, score').where(user_id: @current_user.id )

        
        if defaultSkills
            render json: {
                status: :founded,
                defaultSkills: defaultSkills
            }
        else
            render json:{
                status: 500
            }
        end
    end
end