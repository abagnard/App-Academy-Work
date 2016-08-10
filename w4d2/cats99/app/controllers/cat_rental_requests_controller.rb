class CatRentalRequestsController < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new
    @cats = Cat.all
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_params)
    if @cat_rental_request.save
      redirect_to cat_url(params[:cat_rental_requests][:cat_id])
    else
      render :new
      #render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end
  def approve
    CatRentalRequest.find_by_id(params[:id]).approve!
    redirect_to cats_url
  end

  def deny
    CatRentalRequest.find_by_id(params[:id]).deny!
    redirect_to cats_url
  end

  private
  def cat_rental_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
  end


end
