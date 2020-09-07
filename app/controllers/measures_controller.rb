class MeasuresController < ApplicationController
    include CurrentUserConcern
    def index
        totalScore = Skill.joins(:measures).select('SUM(score) as total').where(user_id: current_user.id )
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
        newScore = Measure.new(skill_id: measure_params[:id], score: measure_params[:newScore])
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

    private
    def measure_params
        params.require(:measure).permit(:id, :newScore)
    end
end