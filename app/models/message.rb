class Message < ActiveRecord::Base
    paginates_per 10
    validates :title, presence: { message: "名前は必須です" }, :length => { :maximum => 15, :message => "名前が長すぎますな" }
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, allow_blank: true ,format: { with: VALID_EMAIL_REGEX }
    validates :comment, presence: { message: "コメントは必須です" }, :length => { :maximum => 100 , :message => "コメントが長すぎますな"}
  def self.message_list
    return Message.all.order(:created_at => :desc)
  end
end
