module ApplicationHelper
  def is_admin?
    @auth.present? && @auth.is_admin?
  end

  def intellinav
    links = ''
    links << "<li>#{link_to('List albums', albums_path)}</li>"
    links << "<li>#{link_to('List artists', artists_path)}</li>"
    links << "<li>#{link_to('List songs', songs_path)}</li>"
     links << "<li>#{link_to('List genres', genres_path)}</li>"
    if @auth.present?
      if @auth.is_admin
        links << "<li>#{link_to('Show Users', users_path)}</li>"
        links << "<li>#{link_to('Add album', new_album_path)}</li>"
      end
      links << "<li>#{link_to('Edit', edit_users_path)}</li>"
      links << "<li>"
      links << "#{link_to('Logout ' + @auth.name, login_path, :method => :delete, :confirm => 'Really?')}"
      links << " #{number_to_currency @auth.balance}"
      links << "</li>"
    else
      links << "<li>#{link_to('Create Account', new_user_path)}</li>"
      links << "<li>#{link_to('Login', login_path)}</li>"
    end

    links
  end
end