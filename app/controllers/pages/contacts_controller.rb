class Pages::ContactsController < ApplicationController
  # ! お問い合わせするメソッド (フォーム入力)
  def new
    @contact = Contact.new

    pp Rails.application.credentials.google[:mail]
  end

  # ! お問い合わせするメソッド (DB登録)
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_mail(@contact, params[:contact][:email]).deliver
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
