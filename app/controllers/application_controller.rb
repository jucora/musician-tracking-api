class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    before_filter :cors_preflight_check

    def cors_preflight_check
        headers['Access-Control-Allow-Origin'] = 'https://musician-tracking-app.web.app/'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end