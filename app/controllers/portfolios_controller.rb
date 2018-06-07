# frozen_string_literal: true

class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :show, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html {redirect_to portfolios_path, notice: 'Portfolio created successfully.'}
      else
        format.html do
          render :new
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html do
          redirect_to @portfolio_item, notice: 'Portfolio updated successfully'
        end
      else
        format.html do
          render :edit
        end
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html do
        redirect_to portfolios_path, notice: 'Portfolio deleted successfully'
      end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(
      :title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name]
    )
  end

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
end
