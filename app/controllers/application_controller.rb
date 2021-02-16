class ApplicationController < ActionController::Base

    helper_method :logged_in?

    def logged_in?
        !session[:user_id].blank? && !session[:user_id].nil? && session[:user_id]
    end
    
    def logged_in_user
        unless logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_path
        end
    end

end
