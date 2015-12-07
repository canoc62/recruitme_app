shared_examples "requires sign in" do
  it "redirects to the sign in page" do
    clear_current_user
    action
    expect(response).to redirect_to sign_in_path
  end 
end

shared_examples "show error and go to root" do
  it "shows the flash error message" do
    expect(flash[:error]).not_to be_empty
  end
  it "redirects to root path" do 
    expect(response).to redirect_to root_path
  end
end