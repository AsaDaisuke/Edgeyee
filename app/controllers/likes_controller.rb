class LikesController < ApplicationController
  def create
    like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
    like.save
    redirect_to("/posts/index")
  end

  def destroy
    like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
    like.destroy
    redirect_to("/posts/index")
  end

  def create_search
    like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
    like.save
    post=Post.find_by(id: params[:post_id])
    redirect_to("/posts/search/#{post.category}")
  end

  def destroy_search
    like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
    like.destroy
    post=Post.find_by(id: params[:post_id])
    redirect_to("/posts/search/#{post.category}")
  end

  def create_show
    like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
    like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy_show
    like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
    like.destroy
    post=Post.find_by(id: params[:post_id])
    redirect_to("/posts/#{params[:post_id]}")
  end

  def create_self
    like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
    like.save
    redirect_to("/users/show/#{@current_user.id}")
  end

  def destroy_self
    like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
    like.destroy
    post=Post.find_by(id: params[:post_id])
    redirect_to("/users/show/#{@current_user.id}")
  end

end
