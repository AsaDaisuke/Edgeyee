class LikesController < ApplicationController
  def create
    @name= params[:top]
    @posts = Post.all.order(created_at: :desc)
    like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
    like.save
    render("posts/index")
  end

  def destroy
    @name= params[:top]
    @posts = Post.all.order(created_at: :desc)
    like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
    like.destroy
    render("posts/index")
  end

  def create_search
    @name= params[:top]
    post=Post.find_by(id: params[:post_id])
    category=post.category
    @category=category.to_i
    info=Category.find_by(number: category)
    @category_name=info.category
    @posts=Post.where(category: category).order(created_at: :desc)
    like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
    like.save
    render("posts/search")
  end

  def destroy_search
    @name= params[:top]
    post=Post.find_by(id: params[:post_id])
    category=post.category
    @category=category.to_i
    info=Category.find_by(number: category)
    @category_name=info.category
    @posts=Post.where(category: category).order(created_at: :desc)
    like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
    like.destroy
    render("posts/search")
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
    @name= params[:top]
    post=Post.find_by(id: params[:post_id])
    @user_shown=post.user
    like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
    like.save
    render("users/show")
  end

  def destroy_self
    @name= params[:top]
    post=Post.find_by(id: params[:post_id])
    @user_shown=post.user
    like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
    like.destroy
    post=Post.find_by(id: params[:post_id])
    render("users/show")
  end

end
