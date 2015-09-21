require 'rails_helper'

RSpec.describe Api::V1::OccurrencesController, type: :controller do

  describe "GET #index" do

    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #show" do
    let(:occurrence) { create(:occurrence) }

    before(:each) do
      get :show, id: occurrence.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested occurrence as @occurrence" do
      expect(assigns(:occurrence)).to eq(occurrence)
    end
  end

  describe "POST #create" do

    before(:each) do
       post :create , occurrence: occurrence_attributes
    end


    context "with valid params" do
      let(:occurrence_attributes) {attributes_for(:occurrence)}

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns a newly created occurrence as @occurrence" do
        expect(assigns(:occurrence)).to be_a(Occurrence)
      end

      it "a new occurrence should be persisted" do
        expect(assigns(:occurrence)).to be_persisted
      end

    end

    context "with invalid params" do
      let(:occurrence_attributes) { attributes_for(:invalid_occurrence)}

      it "assigns a newly created but unsaved occurrence as @occurrence" do
        expect(assigns(:occurrence)).to be_a_new(Occurrence)
      end
    end
  end

  describe "PUT #update" do
    let(:occurrence) {create(:occurrence)}

    before(:each) do
      put :update , id: occurrence.id , occurrence: occurrence_attributes
    end

     context "with valid params" do
      let(:occurrence_attributes) { attributes_for(:occurrence) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "updates the requested occurrence" do
        occurrence.reload
        post_update_attributes = occurrence.attributes.inject({}){|attrs,(k,v)| attrs[k.to_sym] = v; attrs}
        post_update_attributes.delete(:id)
        post_update_attributes.delete(:created_at)
        post_update_attributes.delete(:updated_at)
        expect(occurrence_attributes).to eq(post_update_attributes)
      end

      it "assigns the requested occurrence as @occurrence" do
        expect(assigns(:occurrence)).to eq(occurrence)
      end
    end

    context "with invalid params" do
      let(:occurrence_attributes) { attributes_for(:invalid_occurrence) }

      it "assigns the o as @occurrence" do
        expect(assigns(:occurrence)).to eq(occurrence)
      end
    end
  end


   describe "DELETE #destroy" do
    let(:occurrence) { create(:occurrence) }

    before(:each) do
      delete :destroy, id: occurrence.id
    end

    it "destroys the requested occurrence" do
      expect(Occurrence.exists?(occurrence.id)).to be(false)
    end
  end
end
