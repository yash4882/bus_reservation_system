class UsersController < ApplicationController
  load_and_authorize_resource, except = [:index, :new, :new_login]

  def index
    @users = User.all
    @managers = User.with_role(:manager)
    @buses = Bus.all
  end

  def new_login
    
  end

  # def login
  #   @user = User.where(email: params['email'], password: params['password']).last
  #   if @user.present?
  #     session[:user_id] = @user.id
  #     # MailerJob.set(wait: 30.second).perform_later(@user.id)
  #     if @user.has_role? :admin
  #       redirect_to root_path, success: "You Logged In Successfully!"
  #     else
  #       redirect_to buses_path, success: "You Logged In Successfully!"
  #     end
  #   else
  #     redirect_to new_login_users_path, danger: "Please provide Valid Credentials!"
  #   end
  # end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created Successfully."
      MailSenderJob.set(wait: 30.second).perform_later(@user.id)
      # UserRegistrationMailer.register_notification(@user).deliver_now
      redirect_to new_login_users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  # def signout
  #   session[:user_id] = nil
  #   redirect_to root_path, danger: "Successfully Logged Out!"
  # end

  def change_status
    @user = User.find(params[:id])
    if params[:status].present? && User::STATUSES.include?(params[:status])
      @user.update(status: params[:status])
    end
    redirect_to users_path, notice: "Status updated"
  end
 
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :contact, :role_id, :age, :gender)
    end

    def check_user
      if @current_user.present?
        redirect_to root_path
      end
    end
end
