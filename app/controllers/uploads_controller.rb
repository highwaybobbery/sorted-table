require_relative '../lib/file_parser.rb'
require_relative '../lib/file_representer.rb'

class UploadsController < ApplicationController
  def new
  end

  def create
    file = params[:upload_file]
    file_parser = FileParser.new(file.tempfile)
    file_representer = FileRepresenter.new(file_parser.rows)

    @header = file_representer.header
    @rows = file_representer.rows
    # NOTE: there is no show action on this controller,
    # but there liekly would be very soon.
    render :show

    # TODO: needs error handling to stay on this view and show
    # details on the error (bad delimiter, mismatched rows)
  end
end
