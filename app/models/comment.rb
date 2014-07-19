class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :album

  validates :body, presence: true,
                    length: { minimum: 5 }

                    
end
