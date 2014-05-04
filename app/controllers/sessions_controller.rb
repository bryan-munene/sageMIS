class SessionsController < ApplicationController
before_filter :login_required,:only=>['password_change']
  def index
    redirect_to :action=>'login'
  end
  def login
    @session=nil
    if request.post?
      @login=User.find_by_user_name(params[:user][:login])
      #Rails.logger.debug{"Params are "+params[:user][:login].to_s + params[:user][:password].to_s}
      if @login
      @session = Session.new(:user_id=>@login.id)
      @session.login_ip=request.remote_ip
      if session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
        @session.login_status="success"
        if @session.save
        #Rails.logger.debug{"Login was successful for "+params[:user][:login].to_s}
       #  Rails.logger.debug{@login.inspect}
        if @login.is_first_time.eql?(1)
          flash[:notice]  = "Welcome "+params[:user][:login]+",Your first Login was successful.Please change your default password"
          redirect_to :action => 'password_change', :update_first=>1 and return
        else
          flash[:notice]  = "Welcome "+params[:user][:login]+",Your Login was successful"
          if session[:return_to]
          @return =session[:return_to]
            session[:return_to] = nil
        redirect_to(@return,:notice=>"Login was successful")  and return
        else
        redirect_to :controller=>'dashboard',:action => 'index' and return
        end
        end
        end
      else
        @session.login_status="failed"
        if @session.save
        flash[:error] = "Login failed,please try again."
        #Rails.logger.debug{"Login failed for user "+params[:user][:login].to_s}
        render :layout=> false
        end
      end
    else
      flash[:error] = "Login failed,please try again."
        #Rails.logger.debug{"Login failed for user "+params[:user][:login].to_s}
      #render :layout=> false
    end
    end
    render :layout=> false
  end

  def logout
    @session=Session.find_all_by_user_id(session[:user].id).last
    if @session
      @session.timeout= DateTime.now
    end
    session[:user] = nil
    session[:return_to] = nil

    if @session.save
    flash[:notice] = 'You have been successfully Logged out'
    else
      flash[:error] = 'You have been Logged out but with errors'
      Rails.logger.error{"Session logout details were not updated correctly "}
      #Rails.logger.error{@session.inspect}
    end
    redirect_to :controller => "sessions" ,:action =>"login" and return

  end

  def forgot_password
    if request.post?
      u= User.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:message]  = "A new password has been sent by email."
        redirect_to :action=>'login'
      else
        flash[:error]  = "Couldn't send password"
      end
    end
  end

  def password_change
    @user=session[:user]
    if request.post?

      if  params[:user][:password].eql?(params[:user][:password_confirmation])
         if @user
        User.change_password(@user.user_name,params[:user][:password])
      #@user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:notice
        ]="Password Successfully Changed"
        redirect_to :controller=>'dashboard',:action => 'index'
      end
      else
          flash[:error
        ]="Password Could not be Changed"
      end
      else
            flash[:error
        ]="Passwords entered do not match"
      end
    end
  end
end
