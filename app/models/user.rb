class User < ApplicationRecord
    def posts
        return Post.where(user_id: self.id)
    end

    validates :name, {presence: true}
    validates :email, {presence: true,uniqueness: true}
    validates :password, {presence: true}
    validates :age, {presence: true}
    validates :image_name, {presence: true}
end
