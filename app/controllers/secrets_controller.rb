class SecretsController < ApplicationController
	def index
		@current_user = current_user
		@secrets = Secret.all
	end

	def create
		secret = Secret.create(
			secrets_params.merge(user: current_user)
			)
		if secret.valid?
			redirect_to '/secrets'
		else
			flash[:secrets_errors] = secret.errors.full_messages
			redirect_to "/users/#{current_user.id}"
		end
	end

	def destroy
		Secret.destroy(params[:secret_id])
		redirect_to '/secrets'
	end

	def like
		Like.create(secret: Secret.find(params[:secret_id]), user:current_user)
		redirect_to '/secrets'
	end

	private
		def secrets_params
			params.require(:secret).permit(:content)
		end
end
