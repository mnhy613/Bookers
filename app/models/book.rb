class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { in: 1..200 }
	 def add_error_sample
	    "errors prohibited this obj from being saved"
	    if name.empty?
	      errors.add(:title,)
	      errors[:body]
	    end
	  end




end
