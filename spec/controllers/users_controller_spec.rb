require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){ FactoryBot.create(:user)}
  let(:valid_attributes){
    {name:"abc",email:"abc@gmail.com",password:"aaaaaaaaa"}
  }
  let(:new_attributes){
    {name:"xyz",email:"xyz@gmail.com",password:"xxxxxxxxx"}
  }

  describe "Get" do 
    context "Get /Index" do
      it "should render index page" do
        get 'index'
        expect(response).to render_template :index
      end
  
      it "return a successful response" do
        get 'index'
        expect(response).to be_successful
      end
    end
  
    context "Get /New" do
      it "should render new page" do
        get 'new'
        expect(response).to render_template :new
      end
  
      it "return a successful response" do
        get 'new'
        expect(response).to be_successful
      end
    end
  end

  context "Get /Edit" do
    debugger
    it "should render edit page" do
      user=User.find(id:user.to_param)
      get edit_user_path(user)
    #   expect(response).to render_template :edit
    end
  end


  describe "Post /Create" do

    context "valid attributes" do
      # debugger
      it "should create a user with valid attributes" do
        post 'create', params: {user: FactoryBot.attributes_for(:user)}
        expect(response).to redirect_to users_path
        # expect(flash[:notice].to eq 'User has created successfully')
      end

    end
    context "invalid attributes" do
      it "should not create a user with invalid attributes" do
        post 'create', params: {user: FactoryBot.attributes_for(:user,name:nil)}
        expect(response).to redirect_to users_path
        # expect(flash[:notice]).to eq nil
      end
    end
  end

  describe "Put /update" do
    context "valid attributes" do
      it "should update a requested user" do
        user=User.create! valid_attributes
        put 'update',params:{id:user.to_param,user:new_attributes}
        expect(response).to redirect_to users_path
      end
    end
  end

  # context "Delete /destroy" do 
  # end
end
