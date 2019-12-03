class AddressesController < ApplicationController

	def create
		@address = Address.new(address_params)
		@address.save

	end

	def update
	end

	def destroy
	end

	private
  	def address_params
    	params.require(:address).permit(:name, :address, :postal_code )
  	end
end