require_relative '../lib/file_parser.rb'
require_relative '../lib/file_representer.rb'

class UploadsController < ApplicationController
  def new
  end

  def create
    file = params[:upload_file]
    @filename = file.original_filename
    file_parser = FileParser.new(file.tempfile)
    @file_representer = FileRepresenter.new(file_parser.rows)
    puts @file_representer.rows.first.first

    # NOTE: there is no show action on this controller,
    # but there liekly would be very soon.
    render :show

    # TODO: needs error handling to stay on this view and show
    # details on the error (bad delimiter, mismatched rows)
  end
end
