require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic, user: my_user) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic) }
  
  context "bookmark owner" do
  
    describe "GET new" do
      it "returns http success" do
        sign_in(my_user)
        get :new, { topic_id: my_topic.id }
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET edit" do
      it "returns http success" do
        sign_in(my_user)
        get :edit, { topic_id: my_topic.id, id: my_bookmark.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  context "other user" do
    
    describe "attempt to create new bookmark on other user's topic" do
      it "redirects to the topic show page" do
        other_user = User.create(email: "other_user@bloc.io", password: "password", password_confirmation: "password")
        sign_in(other_user)
        get :new, { topic_id: my_topic.id }
        expect(response).to redirect_to(topic_path)
      end
    end
    
    describe "edit other user's bookmark" do
      it "renders the topic show page" do
        other_user = User.create(email: "other_user@bloc.io", password: "password", password_confirmation: "password")
        sign_in(other_user)
        get :edit, { topic_id: my_topic.id, id: my_bookmark.id }
        expect(response).to redirect_to(topic_path)
      end
    end
  end
end
