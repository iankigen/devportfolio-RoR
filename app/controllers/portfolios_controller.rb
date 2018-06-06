# frozen_string_literal: true
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
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

  def portfolio_params
    params.require(:portfolio).permit(
      :title, :subtitle, :body, :main_image, :thumb_image
    )
  end
end
