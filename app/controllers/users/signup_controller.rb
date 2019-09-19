class Users::SignupController < ApplicationController
  
  
  # 最初のページ
  def index
    
  end

  def registration
    # 新規インスタンス作成
    @user = User.new 
  end


  # 電話番号での確認ページ
  def confirmation
    
  end


  def address
    
  end

  def payment
    
  end

  def complete
    
  end
end
