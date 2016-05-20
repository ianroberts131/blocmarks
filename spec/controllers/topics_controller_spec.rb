require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic, user: my_user) }

  describe "GET index" do
    it "returns http success" do
      sign_in(my_user)
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
    
    it "renders the show view" do
      get :show
      expect(response).to render_template :show
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @topic" do
      get :new
      expect(assigns(:my_topic).not_to be_nil)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST create" do
    it "increases the number of topics by 1" do
      expect{ post :create, topic: {title: Faker:: Hipster.word} }.to change(Topic, :count).by(1)
    end
  end
    

end
