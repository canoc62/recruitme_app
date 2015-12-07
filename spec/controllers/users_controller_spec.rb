require 'rails_helper'

describe UsersController do 

  describe "GET new" do
    it "sets the @user instance variable" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
    it "redirects to user show page for an already authenticated user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :new
      expect(response).to redirect_to user
    end
    it "shows the flash error message for an authenticated user trying to access the user new page" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(flash[:error]).not_to be_empty
    end
  end

  describe "POST create" do
    context "with valid info" do
      before { post :create, user: Fabricate.attributes_for(:user) }
      
      it "creates the user" do
        expect(User.count).to eq(1)
      end
      it "creates a session using the user's id" do
        session[:user_id] = User.first.id
        expect(session[:user_id]).not_to be_nil
      end
      it "shows the flash notice message a newly created user" do
        expect(flash[:notice]).not_to be_nil
      end
      it "redirects to the user show page" do
        expect(response).to redirect_to user_path(User.first)
      end
    end

    context "with invalid info" do
      before { post :create, user: { username: "example_user", password: " " } }

      it "does not create a user" do
        expect(User.count).to eq(0)
      end
      it "shows flash error message" do
        expect(flash[:error]).not_to be_empty
      end
      it "renders the new template" do
        expect(response).to render_template :new
      end
      it "sets the @user instance variable" do
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end

  describe "GET show" do
    it "sets the @user instance variable" do
      user = Fabricate(:user)
      get :show, id: user.id
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "GET edit" do
    let(:user) { Fabricate(:user) }
    
    it "redirects to the root path for unauthenticated users" do
      get :edit, id: user.id
      expect(response).to redirect_to root_path
    end

    context "with authenticated users" do
      before { set_current_user(user) }

      it "sets the @user instance variable" do
        get :edit, id: user.id
        expect(assigns(:user)).to be_instance_of(User)
      end

      context "trying to access the user edit page of other users" do
        let(:user_2) { Fabricate(:user) }
        before { get :edit, id: user_2.id }

        it_behaves_like "show error and go to root" 
      end
    end
  end

  describe "PATCH update" do
    context "with unauthenticated users" do
      let(:user) { Fabricate(:user) }
      before { patch :update, id: user.id }

      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
      it "shows flash error message" do
        expect(flash[:error]).not_to be_empty
      end
    end

    context "with authenticated users" do

      context "with valid input" do 
        let(:user) { Fabricate(:user) }
        before do
          set_current_user(user)
          patch :update, id: user.id, user: Fabricate.attributes_for(:user, first_name: "Jordan")
        end

        it "shows the flash notice message" do
          expect(flash[:notice]).not_to be_empty
        end
        it "redirects to the user show page" do
          expect(response).to redirect_to user
        end

        context "user trying to update the info of other users" do
          let(:user_2) { Fabricate(:user) }
          before { patch :update, id: user_2.id }

          it_behaves_like "show error and go to root"
        end
      end

      context "with invalid input" do
        let(:user) { Fabricate(:user, first_name: "Chris") }
        before do
          set_current_user(user)
          patch :update, id: user.id, user: Fabricate.attributes_for(:user, first_name: "")
        end

        it "does not update the user's info" do
          expect(user.first_name).to eq("Chris")
        end
        it "shows flash error message" do
          expect(flash[:error]).not_to be_empty
        end
        it "renders the edit template" do
          expect(response).to render_template :edit
        end
        it "sets the @user instance variable" do
          expect(assigns(:user)).to eq(user)
        end
      end
    end
  end
end