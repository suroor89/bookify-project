module UsersHelper
  def gravatar_for(user, options = {})
    size = options[:size] || 80
    cl = options[:class].present? ? "gravatar #{options[:class]}" : "gravatar"
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, atl: user.firstname, class: cl)
  end
end
