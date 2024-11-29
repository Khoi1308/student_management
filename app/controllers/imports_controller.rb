class ImportsController < ApplicationController
  def show
  end

  def create
    file = params[:file]

    return redirect_to root_path, alert: 'Only CSV file' unless file.content_type == 'text/csv'

    csvImportService = CsvImportService.new(file)
    csvImportService.import

    redirect_to root_path, notice: "#{csvImportService.number_imported_with_last_run} people imported"
  end
end
