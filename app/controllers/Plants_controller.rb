class PlantsController < ApplicationController

    def index 
        plants = Plant.all
        render json: plants.map{|e|  {id:             e.id, 
            price:          e.price.to_s,
            image:          e.image,
            name:           e.name, 
            created_at:     e.created_at,
            updated_at:     e.updated_at }
        }
    end

    def show
        # byebug
        plant = Plant.find_by(id: plant_params[:id])
        plant_for_succefull_test = { 
            id:             plant.id, 
            price:          plant.price.to_s,
            image:          plant.image,
            name:           plant.name, 
            created_at:     plant.created_at,
            updated_at:     plant.updated_at
         }
        render json: plant_for_succefull_test
        # render json: plant
    end

    def create
        new_plant = Plant.create(plant_params)
        plant_for_succefull_test = { 
            id:             new_plant.id, 
            price:          new_plant.price.to_s,
            image:          new_plant.image,
            name:           new_plant.name, 
            created_at:     new_plant.created_at,
            updated_at:     new_plant.updated_at
         }
        

        render json: plant_for_succefull_test, status: :created

    end
    private

    def plant_params
        params.permit(:id, :name, :image, :price)
    end

end
