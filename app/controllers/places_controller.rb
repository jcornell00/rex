class PlacesController < ApplicationController
  before_action :current_user_must_be_place_owner, :only => [:edit, :update, :destroy]

  def current_user_must_be_place_owner
    place = Place.find(params[:id])

    unless current_user == place.owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(:distinct => true).includes(:owner, :likes, :followers, :fans).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@places.where.not(:address_latitude => nil)) do |place, marker|
      marker.lat place.address_latitude
      marker.lng place.address_longitude
      marker.infowindow "<h5><a href='/places/#{place.id}'>#{place.name}</a></h5><small>#{place.address_formatted_address}</small>"
    end

    render("places/index.html.erb")
  end

  def show
    @like = Like.new
    @place = Place.find(params[:id])

    render("places/show.html.erb")
  end

  def new
    @place = Place.new

    render("places/new.html.erb")
  end

  def create
    @place = Place.new

    @place.name = params[:name]
    @place.address = params[:address]
    @place.description = params[:description]
    @place.lat = params[:lat]
    @place.lng = params[:lng]
    @place.owner_id = params[:owner_id]
    @place.city = params[:city]

    save_status = @place.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/places/new", "/create_place"
        redirect_to("/places")
      else
        redirect_back(:fallback_location => "/", :notice => "Place created successfully.")
      end
    else
      render("places/new.html.erb")
    end
  end

  def edit
    @place = Place.find(params[:id])

    render("places/edit.html.erb")
  end

  def update
    @place = Place.find(params[:id])

    @place.name = params[:name]
    @place.address = params[:address]
    @place.description = params[:description]
    @place.lat = params[:lat]
    @place.lng = params[:lng]
    @place.owner_id = params[:owner_id]
    @place.city = params[:city]

    save_status = @place.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/places/#{@place.id}/edit", "/update_place"
        redirect_to("/places/#{@place.id}", :notice => "Place updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Place updated successfully.")
      end
    else
      render("places/edit.html.erb")
    end
  end

  def destroy
    @place = Place.find(params[:id])

    @place.destroy

    if URI(request.referer).path == "/places/#{@place.id}"
      redirect_to("/", :notice => "Place deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Place deleted.")
    end
  end
end
