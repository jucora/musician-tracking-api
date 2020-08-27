class MeasuresController < ApplicationController
    include CurrentUserConcern
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