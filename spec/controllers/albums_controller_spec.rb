# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  popular    :boolean          default(FALSE)
#

require "rails_helper"

RSpec.describe AlbumsController do
  let(:album) {build(:album)}

  describe "POST #create" do
    it "create a new album" do
      expect(Album).to receive(:new).with({title: 'Test'}).and_return(album)
      expect(album).to receive(:save).and_return(true)
      #post :create, album: {title: 'Test'}
      #post :create, params: {title: 'Test'}, flash: {notice:"Album was created!" }
       post = Album.create(title: 'Test')
      expect(flash[:success]).to eq("Album was created!")
      expect(response).to redirect_to(albums_path)
    end

    it "renders a new action if the album was not saved" do
      expect(Album).to receive(:new).with({title: ''}).and_return(album)
      expect(album).to receive(:save).and_return(false)
      #post :create, album: {title: ''}
      post = Album.create(title: '')

      expect(response).to render_template("new")
    end
  end

  describe "GET #new" do
    it "instantiates a new album" do
      expect(Album).to receive(:new).with(no_args)
      get :new
    end
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all albums into the @albums" do
      expect(Album).to receive(:order).with('created_at DESC').and_return([album])
      get :index
      expect(assigns(:albums)).to match_array([album]) # not_to be_nil
    end
  end
end