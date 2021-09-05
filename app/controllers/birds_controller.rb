class BirdsController < ApplicationController
  #render all of the birds in the index
  def index
    @birds = Bird.all
    render json: birds
  end

  #render a specific bird after finding it by id
  def show
    bird = Bird.find_by(id: params[:id])
    #render json: bird  <- This sends everything 
    #render json: {id: bird.id, name: bird.name, species: bird.species } 
    #render json: bird.slice(:id, :name, :species)
    #render json: birds, only: [:id, :name, :species]
    #render json: birds, except: [:created_at, :updated_at]
    #render json: birds.to_json(except: [:created_at, :updated_at])
    #THERE ARE MANY DIFFERENT WAYS TO WRITE THIS
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

  #show will produce the following minus the created at and updated at
   # {
  #   "id": 2,
  #   "name": "Grackle",
  #   "species": "Quiscalus Quiscula",
  #   "created_at": "2019-05-09T21:51:41.543Z",
  #   "updated_at": "2019-05-09T21:51:41.543Z"
  # }
end