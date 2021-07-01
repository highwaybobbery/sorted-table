require 'rails_helper'

describe UploadsController do
  describe 'GET new' do
    it 'returns a 200' do
      get :new
      expect(response.status).to eq 200
    end

    context 'view rendering' do
      render_views

      it 'renders a view with the correct title' do
        get :new
        expect(response.body).to match /<h1>Welcome to the delimited file viewer/im
      end
    end
  end

  describe 'POST create' do
    let(:filename) {'pipes.txt'}
    let(:file) {
      Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/attachments/#{filename}", 'text')
    }

    it 'ingests the posted file with FileParser' do
      expect(ActionDispatch::Http::UploadedFile).
        to receive(:new).and_return(file)

      expect(FileParser).to receive(:new).with(file).and_call_original
      post :create, params: { upload_file: file }
    end

    context 'view rendering' do
      render_views

      it 'renders the show view' do
        post :create, params: { upload_file: file }
        expect( response.body).to match /<h1>Here is your file!/im
      end

      it 'shows the correct data in the table' do
        post :create, params: { upload_file: file }
        expect( response.body).to match /<td>Ansel Adams<\/td>/
      end
    end
  end
end
