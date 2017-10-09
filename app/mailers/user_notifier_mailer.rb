class UserNotifierMailer < ApplicationMailer

    default :from => 'noreply@restror.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_login_notification(user, code)

        if code == "200"
            @result = "correcto"
        else
            @result = "incorrecto"
        end

        @user = user
        mail( :to => @user.email, :subject => 'Intento de autenticación' )
    end
end
