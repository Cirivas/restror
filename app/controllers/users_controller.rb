class UsersController < ApplicationController
    require 'base64'

    include Webservice

    # GET /users
    # returns all users
    def index
    	@users = User.all
    end

    # GET /users/:id
    # returns a specific user
    def show
    	@user = User.find(params[:id])
    end

    # GET /users/new
    # return an empty user
    def new
        @user = User.new
    end

    # POST /users
    # creates a user
    def create
        @user = User.new

        @user.email = params[:user][:email]
        @user.image = Base64.encode64(File.read(params[:user][:image].path))

        if @user.save
            flash[:success] = "Usuario creado correctamente"
            redirect_to @user
        else
            flash[:error] = "No se pudo crear el usuario"
            redirect_to new_user_path
        end
    end

    # GET /users/login
    def login_form
        puts request.host
    end

    # POST /users/login
    def login
        uri = "http://#{request.host}:#{request.port}/rest/login"
        
        body = {
          "email" => params[:email],
          "image" => Base64.encode64(File.read(params[:image].path))
        }

        response = request_to_uri(uri, body)

        if response.code == "200"
            flash[:success] = "Usuario verificado"
        else
            flash[:error] = "No se pudo verificar el usuario"
        end

        redirect_to login_form_users_path
    end


    # GET /users/:id/edit
    # returns a specific user
    def edit
        @user = User.find(params[:id])
    end

    # PATCH /users/:id
    # PUT /users/:id
    # updates a user
    def update
        @user = User.find(params[:id])
        puts params
        @user.image = Base64.encode64(File.read(params[:user][:image].path))
        if @user.save
            flash[:success] = "Usuario actualizado correctamente"
        else
            flash[:error] = "No se pudo actualizar el usuario"
        end
        redirect_to @user
    end

    # DELETE /users/:id
    # deletes a user
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            flash[:success] = "Usuario eliminado correctamente"
        else
            flash[:error] = "Usuario no pudo ser eliminado"
        end

        redirect_to users_path
    end

    private

    def user_params
    	params.require(:user).permit(:email, :image)
    end
end
