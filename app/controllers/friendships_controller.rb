class FriendshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:create]
	before_action :set_friendship, only: [:destroy, :accept]
	def create
		@friendship = current_user.request_friendship(@user)
		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friendship requested!"}
		end
	end
	def destroy
		@friendship.destroy
		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friendship deleted!"}
		end
	end
	def accept
		@friendship.accept_friendship
		@friendship.create_activity key: 'friendship.accepted', owner: @friendship.user, recipient: @friendship.friend 
		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friendship accepted!"}
		end
	end
	def deny
		@friendship.deny_friendship
		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friendship denied!"}
		end
	end

	private 
	def set_user
		@user = User.find(params[:user_id])
	end
	def set_friendship
		@friendship = Friendship.find(params[:id])
	end

end