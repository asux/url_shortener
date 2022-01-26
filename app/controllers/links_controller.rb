# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :set_link, only: %i[show update destroy]

  # GET /slug
  def redirect_to_url
    @link = Link.find_by(slug: params[:slug])
    if @link.present?
      @link.increment(:redirects)
      @link.save
      redirect_to @link.url
    else
      head :not_found
    end
  end

  # GET /links
  def index
    @links = Link.all

    render json: @links
  end

  # GET /links/1
  def show
    render json: @link
  end

  # POST /links
  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:url, :slug)
  end
end
