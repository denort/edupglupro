class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_rights, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:index]
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
     redirect_to user_path(@user), notice: 'Ваши данные может изменить только администратор' if @user.role == 'teacher'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
          format.html { redirect_to @user,
            notice: "Пользователь" + @user.name + " успешно создан." }
          format.json { render action: 'show', status: :created,
            location: @user}
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User #{@user.name} was successfully updated."}
        format.json { head :no_content}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
      @user.destroy
      flash[:notice] = "Пользователь #{@user.name} удален"
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь' + @user.name + 'удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :role, :fio)
    end

    def check_if_admin
      unless User.find_by_id(session[:user_id]).role == 'administrator'
        redirect_to welcome_index_path, notice: "Доступ к запрошенной странице запрещен. Займитесь другим"
      end
    end

    def check_rights
      unless User.find_by_id(session[:user_id]).role == 'administrator' || session[:user_id].to_i == params[:id].to_i
        redirect_to welcome_index_url, notice: "У Вас недостаточно прав на выполнение запрошенной команды"
      end
    end
end