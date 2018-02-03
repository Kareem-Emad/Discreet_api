class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  before_action :authenticate_user! ,only: [:create,:update,:join]

  def join
    group = Group.where(code: group_params[:code] )
    if group.empty?
      head 401
    else
      unless current_user.groups.include? group
        current_user.groups << group
      end
      render json: @group

    end
  end
  # GET /groups
  def index
    @groups = Group.all.select(:title,:id)

    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create

    @group = current_user.groups.create(group_params)

    if @group.errors.messages.empty?

      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:code, :title)
    end
end
