class HivesController < ApplicationController
  # GET /hives
  # GET /hives.json
  before_filter :signed_in_user , only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user, only:[:edit, :update]
  before_filter :admin_user, only: :destroy
  def index
    @hives = Hive.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hives }
    end
  end

  # GET /hives/1
  # GET /hives/1.json
  def show
    @hive = Hive.find(params[:id])
	@microposts = @hive.microposts.paginate(page: params[:page])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hive }
    end
  end

  # GET /hives/new
  # GET /hives/new.json
  def new
    @hive = Hive.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hive }
    end
  end

  # GET /hives/1/edit
  def edit
    @hive = Hive.find(params[:id])
  end

  # POST /hives
  # POST /hives.json
  def create
    @hive = Hive.new(params[:hive])

    respond_to do |format|
      if @hive.save
		sign_in @hive
        format.html { redirect_to @hive, notice: 'Hive User was successfully created.' }
        format.json { render json: @hive, status: :created, location: @hive }
      else
        format.html { render action: "new" }
        format.json { render json: @hive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hives/1
  # PUT /hives/1.json
  def update
    @hive = Hive.find(params[:id])

    respond_to do |format|
      if @hive.update_attributes(params[:hive])
		sign_in @hive
        format.html { redirect_to @hive, notice: 'Your Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hives/1
  # DELETE /hives/1.json
  def destroy
    @hive = Hive.find(params[:id])
    @hive.destroy

    respond_to do |format|
      format.html { redirect_to hives_url }
      format.json { head :ok }
    end
  end
  def following
  @title = "Following"
  @user = Hive.find(params[:id])
  @hives = @user.followed_hives.paginate(page: params[:page])
  render 'show_follow'
  end
  def followers
  @title = "Followers"
  @user = Hive.find(params[:id])
  @hives = @user.followers.paginate(page: params[:page])
  render "show_follow"
  end
  private
  def correct_user
  @hive = Hive.find(params[:id])
  redirect_to root_path, notice: 'you cannot update another users profile' unless current_user?(@hive)
  end
  def admin_user
  redirect_to root_path unless current_user.admin?
  end
  end
