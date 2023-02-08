class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    def home
        render html: "Successful"
    end
    def create
        user = User.create(name: params[ :name],
            email: params[ :email],
            password: params[ :password],
            phone: params[ :phone]
        )

        render json: user
    end

    def show
        users = User.all
        render json: users
    end


    def authenticate
        
        user = User.find_by(email:params[:email])
        puts(user.name)
        render json: user.authenticate(params[:password])

    end

    def update_password
        
        user = User.find_by(id: params[:id])
        if (user == nil || user.password != params[:old_password])
            render json: {"message": "Wrong Password"}
        else
            user.password = params[:new_password]
            user.save
            render json: user
        end

    end






end
