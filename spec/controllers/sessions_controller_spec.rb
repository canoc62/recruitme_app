require 'rails_helper'

describe SessionsController do 

  describe "POST new" do
    context "with valid credentials" do
      let(:user) {Fabricate(:user)}
      before do 
        post :create, username: user.username, password: user.password
      end

      it "puts the signed in user in the session" do
        expect(session[:user_id]).to eq(user.id)
      end
      it "redirects to the user show page" do
        expect(response).to redirect_to user_path(user)
      end
    end

    context "with invalid credentials" do
      let(:user) {Fabricate(:user)}
      before do 
        post :create, username: user.username, password: "invalid"
      end

      it "does not put the user in a session" do
        expect(session[:user_id]).to be_nil
      end
      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
      it "renders the error message" do
        expect(flash[:error]).not_to be_blank
      end
    end
  end

  describe "GET destroy" do
    let(:user) {Fabricate(:user)}
    before do 
      session[:user_id] = user.id
      get :destroy 
    end

    it "sets the session id to nil" do
      expect(session[:user_id]).to be_nil
    end
    it "renders the logged out flash message" do
      expect(flash[:notice]).not_to be_blank
    end
    it "redirects to the root_path" do
      expect(response).to redirect_to root_path
    end
  end
end