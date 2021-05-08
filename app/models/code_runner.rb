class CodeRunner < ApplicationRecord
  validates :code_file_path, presence: true
  validates :input_test_file_path, presence: true
  validates :language, presence: true
end
