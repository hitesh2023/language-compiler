module CompilationMapper
  def get_mapped_submit_params(presenter_params)
    mapped_params = {}

    if presenter_params.has_key?(:code)
      mapped_params[:code_file_path] = presenter_params[:code]
    end

    if presenter_params.has_key?(:test_case)
      mapped_params[:input_test_file_path] = presenter_params[:test_case]
    end

    if presenter_params.has_key?(:language)
      mapped_params[:language] = presenter_params[:language]
    end

    if presenter_params.has_key?(:time_limit)
      mapped_params[:time_limit] = presenter_params[:time_limit]
    end

    mapped_params[:status] = "processing"
    mapped_params
  end
end