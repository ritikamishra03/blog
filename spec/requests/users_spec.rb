require "rails_helper"

RSpec.describe "Users", type: :request do
    let(:user){ FactoryBot.create(:user)}
    let(:valid_attributes){
    {name:"abc",email:"abc@gmail.com",password:"aaaaaaaaa"}
    }
    let(:new_attributes){
        {name:"xyz",email:"xyz@gmail.com",password:"xxxxxxxxx"}
    }
    describe "Get" do
        context "Get /api/users" do
            it "returns a successful response" do
                get api_users_path
                expect(response).to have_http_status(:ok)
                expect(JSON.parse(response.body).size)
            end
        end

        context "Get /api/users/:id" do
            it "returns a succesful response " do
                get api_user_path(user)
                expect(response).to have_http_status(:ok)
            end
        end
    end

    describe "Post /api/users" do
        context "valid parameters" do
            it "creates a new users" do
               post api_users_path, params:{user: FactoryBot.attributes_for(:user)}
               expect(response).to have_http_status(:created)
            end
        end
        context "invalid parameters" do
            it "creates a new users" do
               post api_users_path, params:{user: FactoryBot.attributes_for(:user,password:nil)}
               expect(response).to be_successful 
            end
        end
    end

    describe "Put /api/users/:id" do
        context "valid parameter for update" do
            it "should update a requested user" do
                user=User.create! valid_attributes
                put api_user_path(user),params:{id:user.to_param,user:new_attributes}
                expect(response).to be_successful
            end
        end
    end

    describe "Delete /api/users/:id" do
        context "valid parameter for delete" do
            it "should delete a requested user" do
                delete api_user_path(user)
                expect(response).to have_http_status(:success)
            end
           
        end
    end
end