class Post < ApplicationRecord
    validates :content, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end

    def find_category
        return Category.find_by(number: self.category)
    end


end
