class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		redirect_to mypage_path(current_user.id)
  	else
  		render 'new'
  	end
  end

  private
  	def contact_params
  		params.require(:contact).permit(:title, :body, :user_id)
	end

end
