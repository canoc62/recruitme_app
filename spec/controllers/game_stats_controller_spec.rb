require 'rails_helper'

describe GameStatsController do 

  describe "GET new" do
    context "with unauthenticated users" do
      it "redirects to the root path" do
        user = Fabricate(:user)
        get :new, user_id: user.id
        expect(response).to redirect_to root_path
      end
      it "shows the flash error message" do
        user = Fabricate(:user)
        get :new, user_id: user.id
        expect(flash[:error]).not_to be_empty
      end
    end

    context "with authenticated users" do
      let(:user) { Fabricate(:user) }
      before { session[:user_id] = user.id }
        
      it "sets the @user instance variable" do
        get :new, user_id: user.id
        expect(assigns(:user)).to be_instance_of(User)
      end
      it "sets the @game_stat instance variable" do
        game_stat = Fabricate(:game_stat)
        get :new, user_id: user.id
        expect(assigns(:game_stat)).to be_instance_of(GameStat)
      end

      context "trying to access new game_stat page of other users" do
        let(:user_2) { Fabricate(:user) }
        before { get :new, user_id: user_2.id }
        
        it "shows the flash error message" do
          expect(flash[:error]).not_to be_empty
        end
        it "redirects to root path" do 
          expect(response).to redirect_to root_path
        end
      end
    end
  end

  describe "POST create" do
    context "with authenticated users" do
      let(:user) { Fabricate(:user) }
      before { session[:user_id] = user.id }
    
      
      context "with valid input" do
        before { post :create, user_id: user.id, game_stat: Fabricate.attributes_for(:game_stat, user_id: user.id) }

        it "creates the game_stat" do
          expect(GameStat.count).to eq(1)
        end
        it "creates a game_stat associated with the user" do
          expect(user.game_stats.count).to eq(1)
        end
        it "shows flash notice message" do
          expect(flash[:notice]).not_to be_empty
        end
        it "redirects to user show page" do
          expect(response).to redirect_to user
        end
      end

      context "trying to create game stats for other users" do
        let(:user_2) { Fabricate(:user) }
        before do
          post :create, user_id: user_2.id, game_stat: Fabricate.attributes_for(:game_stat, user_id: user_2.id)
        end

        it "shows the flash error message" do
          expect(flash[:error]).not_to be_empty
        end
        it "redirects to root path" do 
          expect(response).to redirect_to root_path
        end
      end

      context "with invalid input" do
        before { post :create, user_id: user.id, game_stat: Fabricate.attributes_for(:game_stat, opponent: "", user_id: user.id) }
        
        it "does not create a new game_stat" do
          expect(GameStat.count).to eq(0)
        end
        it "renders the game_stat new form for invalid input" do
          expect(response).to render_template :new
        end
        it "sets the @user instance variable" do
          expect(assigns(:user)).to eq(user)
        end
        it "sets the @game_stat instance variable" do
          game_stat = Fabricate(:game_stat)
          get :new, user_id: user.id
          expect(assigns(:game_stat)).to be_instance_of(GameStat)
        end
        it "shows flash error message" do
          expect(flash[:error]).not_to be_empty
        end
      end
    end

    context "with unauthenticated users" do

      it "redirects to the root path for unauthenticated users" do
        user = Fabricate(:user)
        post :create, user_id: user.id, game_stat: Fabricate.attributes_for(:game_stat, user_id: user.id) 
      end
    end
  end

  describe "GET edit" do
    let(:user) { Fabricate(:user) }
    let(:game_stat) { Fabricate(:game_stat) }
    before { user.game_stats << game_stat }

    context "with authenticated users" do
      let(:user) { Fabricate(:user) }
      let(:game_stat) { Fabricate(:game_stat) }
      before { session[:user_id] = user.id }

      it "sets the @user instance variable" do
        get :new, user_id: user.id, id: game_stat.id
        expect(assigns(:user)).to be_instance_of(User)
      end
      it "sets the @game_stat instance variable" do
        get :new, user_id: user.id, id: game_stat.id
        expect(assigns(:game_stat)).to be_instance_of(GameStat)
      end

      context "trying to access edit page of other users" do
        let(:user_2) { Fabricate(:user) }
        let(:game_stat_2) { Fabricate(:game_stat) }
        before do
          user_2.game_stats << game_stat_2
          get :edit, user_id: user_2.id, id: game_stat_2.id
        end

        it "shows the flash error message" do
          expect(flash[:error]).not_to be_empty
        end
        it "redirects to root path" do 
          expect(response).to redirect_to root_path
        end
      end
    end

    context "with unauthenticated users" do
      it "redirects to the root path" do
        get :new, user_id: user.id, id: game_stat.id
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "PATCH update" do
    let(:user) { Fabricate(:user) }
    let(:game_stat) { Fabricate(:game_stat, opponent: "Crespi") }

    context "with authenticated users" do
      before do 
        session[:user_id] = user.id
        user.game_stats << game_stat 
      end

      context "with valid input" do
        before do
          patch :update, user_id: user.id, id: game_stat.id, game_stat: Fabricate.attributes_for(:game_stat, opponent: "Loyola")
        end

        it "shows the flash notice message" do
          expect(flash[:notice]).not_to be_empty
        end
        it "redirects to user show page" do 
          expect(response).to redirect_to user
        end
      end

      context "trying to update game stats of other users" do
        let(:user_2) { Fabricate(:user) }
        let(:game_stat_2) { Fabricate(:game_stat, opponent: "Bishop Amat") }
        before do
          user_2.game_stats << game_stat_2
          patch :update, user_id: user_2.id, id: game_stat.id, game_stat: Fabricate.attributes_for(:game_stat, opponent: "Loyola")
        end

        it "should not update another user's game stat" do
          expect(user_2.game_stats.first.opponent).to eq("Bishop Amat")
        end
        it "shows the flash error message" do
          expect(flash[:error]).not_to be_empty
        end
        it "redirects to root path" do 
          expect(response).to redirect_to root_path
        end
      end

      context "with invalid input" do
        before do
           patch :update, user_id: user.id, id: game_stat.id, game_stat: Fabricate.attributes_for(:game_stat, opponent: "")
        end

        it "does not change the game stat info" do
          expect(user.game_stats.first.opponent).to eq("Crespi")
        end
        it "sets the @user instance variable" do
          expect(assigns(:user)).to eq(user)
        end
        it "sets the @game_stat instance variable" do
          expect(assigns(:game_stat)).to eq(game_stat)
        end
        it "shows the flash error message" do
          expect(flash[:error]).not_to be_empty
        end
        it "renders the game_stat edit page" do
          expect(response).to render_template :edit
        end
      end
    end

    context "with unauthenticated users" do
      before do
        patch :update, user_id: user.id, id: game_stat.id, game_stat: Fabricate.attributes_for(:game_stat, opponent: "")
      end

      it "shows the flash error message" do
        expect(flash[:error]).not_to be_empty
      end
      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
    end
  end
end