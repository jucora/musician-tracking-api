class StaticController < ApplicationController
    def home
        render json: {status: 'Application working correctly'}
    end
end