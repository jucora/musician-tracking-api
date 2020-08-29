class RegistrationsController < ApplicationController
    def create
        user = User.create!(
            email: params["user"]["email"], 
            password: params["user"]["password"], 
            password_confirmation: params["user"]["password_confirmation"]
        )
        if user
            session[:user_id] = {  value: user.id,
            expires: 1.year.from_now,
            same_site: :none,
            secure: true}

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
                status: 500
            }
        end
    end
end