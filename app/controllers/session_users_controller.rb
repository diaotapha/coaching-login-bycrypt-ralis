class SessionUsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    respond_to do |format|
      if @user&.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        format.html { redirect_to todos_path, notice: "Connexion réussie" }
      else
        format.html { render :new, status: :unprocessable_entity }
        erreurs = []
        erreurs << "Email incorrect" if !@user.present?
        erreurs << "Mot de passe incorrect" if !@user&.authenticate(params[:password])
        format.turbo_stream { render turbo_stream: turbo_stream.replace("login-form", partial: "session_users/form", locals: { user: User.new, erreurs: erreurs }) }
      end
    end
  end
end

# if @user&.authenticate(params[:password])
#   session[:user_id] = @user.id
#   redirect_to todos_path, notice: "Connexion réussie"
# else
#   redirect_to login_path, alert: "Email ou mot de passe incorrect"
# end
