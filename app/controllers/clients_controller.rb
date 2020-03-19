# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :set_client, only: %i[show update destroy add_product]
  skip_before_action :authenticate_request, only: %i[create]

  def index
    @clients = Client.all

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    save_client
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  def add_product
    @client.products = (@client.products || {}).merge!(Hash[product_params[:id], product_params])

    save_client
  end

  private

  def save_client
    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def set_client
    @client = Client.find(params[:id] || params[:client_id])
  end

  def client_params
    params.fetch(:client, {}).permit(:email, :password)
  end

  def product_params
    params.fetch(:product, {}).permit(:price, :image, :brand, :id, :title)
  end
end
