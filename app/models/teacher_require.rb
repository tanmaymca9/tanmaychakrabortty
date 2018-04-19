class TeacherRequire < ApplicationRecord
	validates_presence_of :qualification,:subject,:level,:experience,:annual_salary, :message => "can't be empty"
end
