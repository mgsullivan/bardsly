module UsersHelper
	def action_buttons(user)
		case current_user.friendship_status(user) 
			when "friends"
				link_to "Cancel Friendship", friendship_path(id:current_user.friendship_relation(user).id), method: :delete
			when "pending"
				"Cancel Request"
				link_to "Cancel Request", friendship_path(id:current_user.friendship_relation(user).id), method: :delete
			when "requested"
				link_to "Accept", accept_friendship_path(id:current_user.friendship_relation(user).id), method: :put
			when "not_friends"
				link_to "Add as a friend", friendships_path(user_id:user.id), method: :post
			when "self"
				"Me"
		end

	end
end
