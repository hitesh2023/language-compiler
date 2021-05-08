module Compiler
  class CppCompiler
    def initialize(code_runner_obj)
      @code_runner_obj = code_runner_obj
      @code_path = code_runner_obj.code_file_path
      @input_path = code_runner_obj.input_test_file_path

      path = @code_path.split("/")
      path.pop
      path = path.join("/")

      @code_path_executable = path + "/code_exe"
      @output_path = path + "/output.txt"
    end

    def start_compilation 
      response = system("touch #{@code_path_executable} #{@output_path}")
      current_time = Time.now
      response = system("g++ #{@code_path} -c #{@code_path_executable} -o #{@output_path} < #{@input_path}")
      elapsed_time = Time.now - current_time
      
      if response
        @code_runner_obj.status = Constants::CompilationStatus::DONE
        @code_runner_obj.output_test_file_path = @output_path
        @code_runner_obj.time_taken = elapsed_time
        @code_runner_obj.save
      end
    end
  end
end
