module Compiler
  class PythonCompiler
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
      response = system("python #{@code_path} -c #{@code_path_executable} -o #{@output_path} < #{@input_path}")

      # pending
    end
  end
end
