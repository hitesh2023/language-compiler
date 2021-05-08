module Compiler
  class BaseCompiler
    class << self
      def get_compiler(language_type)
        throw "unsupported language type" if Constants.supported_languages.exclude?(language_type)

        case language_type
        when Constants::CPP
          Compiler::CppCompiler
        when Constants::PYTHON
          Compiler::PythonCompiler
        end
      end
    end
  end
end