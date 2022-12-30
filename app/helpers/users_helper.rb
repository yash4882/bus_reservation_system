module UsersHelper
  def format_name(user)
    if @user.gender == "Male"
      "Mr. #{@user.name}"
    else
      "Ms. #{@user.name}"
    end
  end
end
