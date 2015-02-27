module UsersHelper
  def image_view(user)
    user.image_url ? user.image_url : user.gravatar_url(:d => "http%3A%2F%2Fi.imgur.com%2FUFa4kwT.png")
  end
end
