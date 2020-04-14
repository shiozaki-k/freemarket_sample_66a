require 'rails_helper'

describe ProductsController, type: :controller do

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "edit.html.hamlに遷移すること" do
    end
  end

  describe 'GET #index' do
    it "@productsに正しい値が入っていること" do
    end
    it "index.html.hamlに遷移すること" do
    end
  end

end


# RSpec.describe ProductsController, type: :controller do