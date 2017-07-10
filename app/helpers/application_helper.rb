module ApplicationHelper
  def is_admin?
    current_user && current_user.admin
  end

  # def has_account
  #   if Account.where(user_id: current_user)
  #     Account.where(user_id: current_user)
  #   else
  #     Account.create({:user_id=>current_user})
  #   end
  # end
end
