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
    let(:output_rows) {
      [
        ['i am', 'a very good', 'tester'],
        ['when i am', 'not too', 'sleepy']
      ]
    }

    let(:header) {
      ['good', 'dogs', 'get', 'naps']
    }

    it 'ingests the posted file with FileParser' do
      expect(FileParser).to receive(:new).with(instance_of(Tempfile)).and_call_original
      post :create, params: { upload_file: file }
    end

    it 'passes the rows to the FileRepresenter' do
      allow_any_instance_of(FileParser).to receive(:rows).and_return output_rows
      expect(FileRepresenter).to receive(:new).with(output_rows).and_call_original

      post :create, params: { upload_file: file }
    end
  end
end
