class Book < ApplicationRecord
has_one_attached :book
belongs_to :user
has_one_attached :image
validates :title, presence: true
validates :body,length: { minimum: 1, maximum:200 }
end

def book_params
    params.require(:book).permit(:title, :body)  
end





