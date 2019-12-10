class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def signup
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], rank: params[:select_form], age: params[:age], image_name: "default_image.jpg")
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    end
  end

  #ログイン画面表示
  def login_form
  end

  #ログイン
  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/show/#{@user.id}")
    else
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end


  def show
    @user_shown = User.find_by(id:params[:id])
  end

  def show_0
    @user=User.find_by(id: params[:id])
  end
  def show_10
    @user=User.find_by(id: params[:id])
  end
  def show_11
    @user=User.find_by(id: params[:id])
  end
  def show_12
    @user=User.find_by(id: params[:id])
  end
  def show_13
    @user=User.find_by(id: params[:id])
  end
  def show_14
    @user=User.find_by(id: params[:id])
  end
  def show_15
    @user=User.find_by(id: params[:id])
  end
  def show_20
    @user=User.find_by(id: params[:id])
  end
  def show_21
    @user=User.find_by(id: params[:id])
  end
  def show_22
    @user=User.find_by(id: params[:id])
  end
  def show_23
    @user=User.find_by(id: params[:id])
  end
  def show_24
    @user=User.find_by(id: params[:id])
  end
  def show_25
    @user=User.find_by(id: params[:id])
  end
  def show_30
    @user=User.find_by(id: params[:id])
  end
  def show_31
    @user=User.find_by(id: params[:id])
  end
  def show_32
    @user=User.find_by(id: params[:id])
  end
  def show_33
    @user=User.find_by(id: params[:id])
  end
  def show_34
    @user=User.find_by(id: params[:id])
  end

end
