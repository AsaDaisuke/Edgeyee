class LikesController < ApplicationController
  def create
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
      @name= params[:top]
      @posts = Post.all.order(created_at: :desc)
      render("posts/index")
    else
      @name= params[:top]
      @posts = Post.all.order(created_at: :desc)
      like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
      like.save
      render("posts/index")
    end
  end

  def destroy
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
      @name= params[:top]
      @posts = Post.all.order(created_at: :desc)
      like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
      like.destroy
      render("posts/index")
    else
      @name= params[:top]
      @posts = Post.all.order(created_at: :desc)
      render("posts/index")
    end
  end

  def create_search
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      category=post.category
      @category=category.to_i
      info=Category.find_by(number: category)
      @category_name=info.category
      @posts=Post.where(category: category).order(created_at: :desc)
      render("posts/search")
    else
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
  end

  def destroy_search
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
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
    else
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      category=post.category
      @category=category.to_i
      info=Category.find_by(number: category)
      @category_name=info.category
      @posts=Post.where(category: category).order(created_at: :desc)
      render("posts/search")
    end
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
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user_shown=post.user
      render("users/show")
    else
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user_shown=post.user
      like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
      like.save
      render("users/show")
    end
  end

  def destroy_self
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user_shown=post.user
      like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
      like.destroy
      render("users/show")
    else
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user_shown=post.user
      render("users/show")
    end
  end

  def create_self_
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user=post.user
      category=post.category
      render("users/show_#{category}")
    else
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user=post.user
      category=post.category
      like=Like.new(user_id: @current_user.id, post_id: params[:post_id])
      like.save
      render("users/show_#{category}")
    end
  end

  def destroy_self_
    if Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user=post.user
      category=post.category
      like=Like.find_by(user_id: @current_user, post_id: params[:post_id])
      like.destroy
      render("users/show_#{category}")
    else
      @name= params[:top]
      post=Post.find_by(id: params[:post_id])
      @user=post.user
      category=post.category
      render("users/show_#{category}")
    end
  end
end
