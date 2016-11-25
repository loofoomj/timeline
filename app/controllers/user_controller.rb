class UserController < ApplicationController
  def signup
  end

  def signup_complete
  	u = User.new
  	u.username = params[:username]
  	if params[:password] == params[:retype_password]
  		u.password = params[:password]
  		if u.save
  			flash[:alert] = "회원가입 완료"
  			redirect_to "/wall/posts"
  		else
  			flash[:alert] = u.errors.values.flatten.join(' ')
  			redirect_to :back
  		end
  	else
  		flash[:alert] = "패스워드가 일치하지 않습니다."
  		redirect_to :back
  	end
  	
  end

  def login
    	
  end

  def login_complete
  	u = User.where(username: params[:username])[0]
  	if u.nil?
  		flash[:alert] = "아이디 또는 비밀번호를 확인해주세요"
  		redirect_to :back
  	else
  		if u.password != params[:password]
  			flash[:alert] = "아이디 또는 비밀번호를 확인해주세요"
  			redirect_to :back
  		else
  			cookies[:user_id] = u.id
  			flash[:alert] = "로그인 완료"
  			redirect_to "/wall/posts"
  		end
  		
  	end
    end  

    def logout
    	cookies.delete(:user_id)
    	redirect_to :back
    end

    def delete_user
      @user_delete = User.find(params[:user_id])
    end

    def delete_user_complete
      u = User.find(params[:id])
      u.destroy
      cookies.delete(:user_id)
      redirect_to "/wall/posts"
    end
end
