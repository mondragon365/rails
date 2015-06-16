class UsersController < ApplicationController
	def index
		@usuarios=User.all
	end
	def show
		@usuario=User.find(params[:id])
		render action: "detalle"
	end
	def detalle
		@usuario=User.find(params[:id])
	end
	def destroy
		User.find(params[:id]).destroy
		redirect_to users_url
	end
	def edit
		@usuario=User.find(params[:id])
	end
	def update
		@usuario=User.find(params[:id])
		if @usuario.update_attributes(user_params)
			flash[:success]="bienvenidos"
			redirect_to users_url
		else
			render action: 'edit'
		end
	end
	def new
		@usuario =User.new
	end
	def create
		@usuario = User.new(user_params)
		if @usuario.save
			redirect_to users_url
		else
			render action: 'new'
		end
	end
	private
	def user_params
		params.require(:user).permit(:nombre,:email,:password,:password_confirmation)
	end
end