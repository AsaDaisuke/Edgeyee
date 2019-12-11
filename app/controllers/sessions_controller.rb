# coding: utf-8
class SessionsController < ApplicationController
  def create
    # request.env['omniauth.auth']にユーザのTwitter認証情報が格納されている
    user_data = request.env['omniauth.auth']
    session[:nickname] = user_data[:info][:nickname]
    redirect_to root_path, notice: 'ログインしました'
  end
end
