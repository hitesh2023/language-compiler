module Constants
  CPP = "c++"
  PYTHON = "python2"

  def self.supported_languages
    constants.map { |const| const_get(const) }
  end

  module CompilationStatus 
    PROCESSING = "processing"
    DONE = "done"
    COMPILATION_ERROR = "compilation_error"
    RUNTIME_ERROR = "runtime_error"
    TIME_LIMIT_EXCEEDED = "tle"
  end
end