class CompilationController < ApplicationController
  include CompilationMapper
  
  before_action :validate_submit_params, only: [:submit]
  before_action :validate_get_params, only: [:status, :output]
  before_action :load_code_runner, only: [:status, :output]
  
  def submit
    mapped_params = get_mapped_submit_params(get_indexed_params_permit)

    code_runner_obj = CodeRunner.new(mapped_params)
    if code_runner_obj.save
      code_runner_obj.reload
      Thread.new { 
        Compiler::BaseCompiler
          .get_compiler( mapped_params[:language] )
          .new(code_runner_obj)
          .start_compilation 
      }
      render head: :success, status: :created, json: { session_id: code_runner_obj.session_id }
    else 
      render head: :no_content, status: :bad_request, json: { errors: code_runner_obj.errors.full_messages }
    end
  end

  def status
    if @code_runner.blank?
      render head: :not_found, json: { error: "No active compilation with session_id: #{params[:session_id]} is running" }   
    elsif @code_runner.status == Constants::CompilationStatus::DONE
      render head: :success, json: { time_taken: @code_runner.time_taken, std_output: @code_runner.output_test_file_path } 
    else
      render head: :success, json: { status: @code_runner.status } 
    end
  end

  def output
    if @code_runner.present? && @code_runner.status == Constants::CompilationStatus::DONE
      render head: :success, json: { time_taken: @code_runner.time_taken, std_output: @code_runner.output_test_file_path } 
    else
      render head: :not_found, json: { error: "No active Compilation with session_id: #{params[:session_id]} is completed" }   
    end
  end

  private

  def validate_get_params
    unless params && params[:session_id].present?
      render head: :no_content, status: :bad_request, json: { message: "`session_id` are mandatory params" }
      return 
    end
  end

  def validate_submit_params
    unless params && params[:code].present? && params[:test_case].present? && params[:language].present?
      render head: :no_content, status: :bad_request, json: { message: "`code`, `test_case` & `language` are mandatory params" }
      return 
    end
  end

  def load_code_runner
    @code_runner = CodeRunner.find_by(session_id: params[:session_id])
  end

  def get_indexed_params_permit
    params.permit(:code, :test_case, :language, :time_limit)
  end
end
