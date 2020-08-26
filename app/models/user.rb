class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 8..128
  validates :name,
            length: {minimum: 2, maximum: 20}

  def update_without_current_password(params, *options)
    params.delete(:current_password) #＊params.delete(:current_password) で current_password のパラメータを削除。

    if params[:password].blank? && params[:password_confirmation].blank? #＊パスワード変更のためのパスワード入力フィールドとその確認フィールドの両者とも空の場合のみ、パスワードなしで更新できるようにするためです。

      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end