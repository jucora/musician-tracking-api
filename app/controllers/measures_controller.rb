class MeasuresController < ApplicationController
    include CurrentUserConcern
    def index
        totalScore = Skill.joins(:measures).select('SUM(score) as total').where(user_id: @current_user.id )
        if totalScore
            render json: {
                status: :founded,
                totalScore: totalScore,
            }
        else
            render json:{
                status: 500
            }
        end
    end


    def create
        newScore = Measure.create!(skill_id: params["skill"]["id"], score: params["skill"]["newScore"])
        if newScore
            render json: {
                status: :updated,
                newScore: newScore
            }
        else
            render json:{
                status: 500
            }
        end
    end
end