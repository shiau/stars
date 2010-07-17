class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:create, :new]

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      render :action => :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.by_recent_stars
    if @users.first.stars.any?
      @featured_user = @users.first
      @users = @users[1..-1]
    end
  end

  def show
    @user = User.find( params[:id] )
    sender_totals = @user.stars.inject( Hash.new {0} ) do | s, star |
      s[star.from_id] += 1 
      s
    end
    @sender_totals = sender_totals.sort { |a,b| a[1] <=> b[1] }.reverse
  end

  def new
    @user = User.new
  end
end
