class RegistrationsController < ApplicationController
    def create
        user = User.create!(
            email: params["user"]["email"], 
            password: params["user"]["password"], 
            password_confirmation: params["user"]["password_confirmation"]
        )
        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: user
            }
        else
            render json:{
                status: 500
            }
        end

        DefaultSkills.all.each do |ds|
            DefaultSkillMeasures.create!(user_id: user.id, default_skills_id: ds.id)
        end
    end
end