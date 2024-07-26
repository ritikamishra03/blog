class User < ApplicationRecord
    # has_many :articles, dependent: :destroy

    # self.primary_key = [:article_id, :id]
    # has_many :articles

    # self.primary_key = [:name]
    has_many :articles
    # has_secure_password

    # devise :database_authenticatable, :registerable,
    #      :recoverable, :rememberable, :validatable,
    #      :confirmable, :lockable, :timeoutable, :trackable

    # before_validation :normalize_name, on: [:create, :update]
    before_validation :give_default_name, on: :create

    validates :name, presence:true , length: {maximum: 50}
    validates :email, presence:true, uniqueness:true, format:{with: URI::MailTo::EMAIL_REGEXP}
    validates :password, presence:true, length: {in: 6..10}
    validates :name, :email, presence: true

    after_create_commit :log_user_saved_to_db
    after_update_commit :log_user_saved_to_db
    after_save_commit :log_user_saved_to_db

    private
    def log_user_saved_to_db
        puts "user was saved to database"
    end

    after_create -> {puts "congratulations!"}

    after_initialize do |user|
        puts "you have initialize an object"
    end

    after_find do |user|
        puts "you have found an object"
    end
    
    after_touch do |user|
        puts "You have touched an object"
    end

    def give_default_name
        self.name='xyz' if name.blank?
    end

    before_create do
        self.name=email.capitalize if name.blank?
    end
    # def give_default_email
    #     self.email=email unless email.blank?
    # end
    def normalize_name
        self.name=name.downcase.titleize
    end

    
end
