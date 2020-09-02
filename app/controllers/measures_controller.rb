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
        newScore = Measure.new(skill_id: params["skill"]["id"], score: params["skill"]["newScore"])
        if newScore.save
            render json: {
                status: :updated,
                newScore: newScore
            }
        else
            render json:{
                status: 500,
                errors: newScore.errors.full_messages
            }
        end
    end
end