require 'rails_helper'
describe "UserController" do
  context "トップページが表示される" do
    it 'top' do
     visit "admin/users/top"
    end
  end
end
