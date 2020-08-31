class RegistrationsController < ApplicationController
    def create
        user = User.new(
            email: params["user"]["email"], 
            password: params["user"]["password"], 
            password_confirmation: params["user"]["password_confirmation"]
        )
        if user.save
            session[:user_id] = user.id

            defaultSkills=["Harmony", "Rhythm", "Improvisation", "Scales", "Arpeggios", "Ear training"]
            userDefaultSkills = []
            defaultSkills.each do |ds|
                newSkill = Skill.create!(user_id: user.id, name: ds)
                userDefaultSkills.push(newSkill)
                Measure.create!(skill_id: newSkill.id)
            end
            
            render json: {
                status: :created,
                user: user,
                default_skills: userDefaultSkills
            }

        else
            render json:{
                status: 500,
                errors: user.errors.full_messages
            }
        end
    end
end