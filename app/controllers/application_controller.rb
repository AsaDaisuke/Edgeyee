class ApplicationController < ActionController::Base
  before_action :set_current_user

　#常に全てのアクションの前に、現在のユーザーの情報を@current_userに代入しておき、いつでも使えるようにしています。
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
