module WelcomeHelpers
  def sign_in(user)
    post login_path, params: { session: { uni: user.uni, password: user.password } }
  end
end

