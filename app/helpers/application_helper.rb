module ApplicationHelper
	def get_alert_from_flash_type flash_type
		case flash_type
		when "notice"
			"alert alert-info"
		when "alert"
			"alert alert-warning"
		when "error"
			"alert alert-danger"
		else
			"alert alert-info"
		end
	end
	def request_count
	  	if current_user 
	  		current_user.pending_friend_requests_from.count
	  	end
  end
end
