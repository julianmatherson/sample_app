module SessionsHelper

    #logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user?(user)
        current_user && current_user == user
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    
    def logged_in?
        !current_user.nil?
    end

    def log_out
        reset_session
        @current_user = nil
    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get? 
    end

end
