require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "GET #index" do
    let(:user) { create(:user) }

    before(:each) do
       get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns all users as @users" do
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }

    before(:each) do
       get :show, id: user.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested user as @user" do
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do

    before(:each) do
      post :create , user: user_attributes
    end

    context "with valid params" do
      let(:user_attributes) { attributes_for(:user) }

      it "assigns a newly created user as @user" do
        expect(assigns(:user)).to be_a(User)
      end

      it "a new user should be persisted" do
        expect(assigns(:user)).to be_persisted
      end
    end

    context "with invalid params" do
      let(:user_attributes) { attributes_for(:invalid_user) }

      it "assigns a newly created but unsaved user as @user" do
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "PUT #update" do
    let(:user) {create(:user)}

    before(:each) do
      put :update , id: user.id , user: user_attributes
    end

     context "with valid params" do
      let(:user_attributes) { attributes_for(:user) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "updates the requested user" do
        user.reload
        post_update_attributes = user.attributes.inject({}){|attrs,(k,v)| attrs[k.to_sym] = v; attrs}
        post_update_attributes.delete(:id)
        post_update_attributes.delete(:created_at)
        post_update_attributes.delete(:updated_at)
        expect(user_attributes).to eq(post_update_attributes)
      end

      it "updates the requested user 2" do
        expect(user_attributes).to eq(user)
      end

      it "assigns the requested user as @user" do
        expect(assigns(:user)).to eq(user)
      end
    end

    context "with invalid params" do
      let(:user_attributes) { attributes_for(:invalid_user) }

      it "assigns the user as @user" do
        expect(assigns(:user)).to eq(user)
      end
    end
  end


  describe "DELETE #destroy" do
    let(:user) { create(:user) }

    before(:each) do
      delete :destroy, id: user.id
    end

    it "destroys the requested user" do
      expect(User.exists?(user.id)).to be(false)
    end
  end
end
