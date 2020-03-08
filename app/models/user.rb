class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

	 # def add_error_sample
	 #    "errors prohibited this obj from being saved"
	 #    if name.empty?
	 #      errors.add(:name)
  #     end
	 #  end


   validates :introduction, length: { maximum: 50 }

   validates :name, length:{minimum: 2, maximum: 20}, presence:{message: "errorです"}




end
