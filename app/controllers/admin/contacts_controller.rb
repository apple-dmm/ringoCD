class Admin::ContactsController < ApplicationController
  def show
  	@contact = Contact.find(params[:id])
  	@reply = Reply.new
  end

  def create
  	contact = Contact.find(params[:reply][:contact_id])
  	user = contact.user
  	reply = Reply.new(reply_params)
  	if reply.save
  		ContactMailer.send_when_admin_reply(user, contact, reply).deliver
  		redirect_to admin_contacts_path
  	else
  		render 'show'
  	end
  end

  def index
  	@q = Contact.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @contacts = @q.result(distinct: true).page(params[:page]).per(30)
  end


  private
  def contact_params
    params.require(:contact).permit(:title, :body, :user_id)
  end

  def reply_params
  	params.require(:reply).permit(:title, :body, :contact_id)
  end
end
