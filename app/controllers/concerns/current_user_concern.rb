module CurrentUserConcern
    extend ActiveSupport::Concern

    included do
        before_action :current_user
    end

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    
end
