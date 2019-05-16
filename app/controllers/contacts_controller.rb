class ContactsController < ApplicationController
  
# GET /contact-us  
# Show new contact form
  def new
    @contact = Contact.new
  end
  
# POST request /contacts
def create
  # mass assignment of form fields into Contact object
  @contact = Contact.new(contact_params)
  # request to poste to database
  if @contact.save
  # store form fields via parameters into variables
    name = params[:contact][:name]
    email = params[:contact][:email]
    body = params[:contact][:comments]
    # Plug variables into Contact Mailer
    # Email method and send email
    ContactMailer.contact_email(name, email, body).deliver
    # Stire syccess nessage ub flash hash.
    flash[:success] = "Message sent."
    # show message and redirect to new action
    redirect_to new_contact_path
  else
    # If contact no save,
    # store errors in flash hash
    flash[:danger] = @contact.errors.full_messages.join(",")
    # redirect to new action/form page
    redirect_to new_contact_path
  end
end

# whitelist this contact form input
private 
  #strong parameters
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
end
