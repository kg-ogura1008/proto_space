class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.all
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

  def show
    @proto_type = Prototype.find(params[:id])
    @title = @prototype.title.includes(:user)
    # @comments = @prototype.comments.inclueds(:user)
    @catch_copy = @prototype.catch_copy.includes(:user)
    @concept = @prototype.concept.includes(:user)
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
      captured_images_attributes: [:content, :status]
    )
  end
end
