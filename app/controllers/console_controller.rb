class ConsoleController < ApplicationController
  def view
    @categories_all = Category.all.order(number: :asc)
  end

  def create
    lines_input = @str_input.split("\n")
    categories_skipped = []
    categories_created = []
    lines_input.each do |line|
      item = line.split(" ")
      if Category.find_by(number: item[0].to_i)
        categories_skipped.push(item)
      else
        category = Category.new(number: item[0].to_i,category: item[1])
        category.save
        categories_created.push(item)
      end      
    end
    @categories_created = categories_created
    @categories_skipped = categories_skipped
    render action: :log_database_change
  end

  def create_from_textarea
    @str_input = params[:content]
    create
  end

  def create_by_default
    @str_input =  
"0 skating
10 salchow
11 toe loop
12 loop
13 flip
14 luzs
15 axel
20 Up
21 Sit
22 Camel
23 Layback
24 Combi
25 Flying
30 振付
31 compulsory
32 dance
33 mental
34 others"
    create
 
  end

  def delete_confirm
    session[:delete_category] = params[:number]
    @category = Category.find_by(number: session[:delete_category].to_i)
  end

  def delete
    categories_kept = []
    categories_deleted = []    
    if session[:delete_category] != params[:number]
      categories_kept.push(Category.find_by(number: session[:delete_category]))
      categories_kept.push(Category.find_by(number: params[:number]))
    else
      category = Category.find_by(number: session[:delete_category].to_i)
      category.destroy
      categories_deleted.push(category)
    end
    @categories_kept = categories_kept
    @categories_deleted = categories_deleted
    render action: :log_database_change
  end
  def export
    view
  end


end
