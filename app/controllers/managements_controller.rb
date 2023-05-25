class ManagementsController < ApplicationController
  before_action :set_management, only: %i[ show update destroy ]

  # GET /managements
  def index
    @managements = Management.all

    render json: @managements
  end

  # GET /managements/1
  def show
    render json: @management
  end

  # POST /managements
  def create
    @management = Management.new(management_params)

    if @management.save
      render json: @management, status: :created, location: @management
    else
      render json: @management.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /managements/1
  def update
    if @management.update(management_params)
      render json: @management
    else
      render json: @management.errors, status: :unprocessable_entity
    end
  end

  # DELETE /managements/1
  def destroy
    @management.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_management
      @management = Management.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def management_params
      params.require(:management).permit(:id, :date, :time, :description, :owner, :category, :due_date, :status, :notes)
    end
end
