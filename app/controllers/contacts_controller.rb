class ContactsController < ApplicationController
 
  # layout "contact"

  # contacts
  # GET /contacts(.:format)
  def index
    @contacts = Contact.all
  end

  # contact
  # GET /contacts/:id(.:format)
  def show
    @contact = Contact.find(params[:id])
  end
  
  # new_contact
  # GET /contacts/new(.:format)
  def new
    @contact = Contact.new
  end

  # contacts
  # POST /contacts(.:format)
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      redirect_to @contact
    else
      render "new"
    end
  end

  # contact
  # PUT /contacts/:id(.:format)
  def update
    @contact = Contact.find(params[:id])
    
    if @contact.update_attributes(contact_params)
      redirect_to @contact
    else
      render "edit"
    end
  end

  # edit_contact
  # GET /contacts/:id/edit(.:format)
  def edit
    @contact = Contact.find(params[:id])
  end

  # contact
  # DELETE /contacts/:id(.:format)
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_path
  end

  # search action
  def search
    search_field = params[:searchCriteria]
    value = params[:inputText]
    @contacts = Contact.find_by search_field, value

    redirect_to homepage_path
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number)
  end

end
