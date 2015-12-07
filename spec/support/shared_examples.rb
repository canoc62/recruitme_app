shared_examples "show error and go to root" do
  it "shows the flash error message" do
    expect(flash[:error]).not_to be_empty
  end
  it "redirects to root path" do 
    expect(response).to redirect_to root_path
  end
end