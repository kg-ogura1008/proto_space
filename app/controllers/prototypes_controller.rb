class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.all.page(params[:page]).per(2).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'New prototype was unsuccessfully created'
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      redirect_to :root, notice: 'Your prototypes was sucessfully deleted'
      @prototype.destroy
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @tags = @prototype.tags
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(update_prototype_params)
    if @prototype.save
       redirect_to :root, notice: 'Your Prototype was successfully updated'
    else
      render 'edit'
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]).merge(prototype_list: (params[:prototype][:tags]).values)
  end

    def update_prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status, :_destroy, :id])
  end
end
