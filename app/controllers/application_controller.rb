class ApplicationController < ActionController::Base

    helper_method :current_user

    private
        def current_user
            session[:user_id].blank? || session[:user_id].nil? || !session[:user_id]
        end
end
