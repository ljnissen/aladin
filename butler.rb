require 'sinatra'
require 'pathname'

get '/' do 
	html = "<h1>Your files, sir!</h1>"
	dir = "./files/"
	Dir[dir + "*"].each do |file|
		html += file_link(file)
	end
	html
end

helpers do
	def file_link(file)
		filename = Pathname.new(file).basename
		"<a href='#{file}'>#{filename}</a><br />"
	end
end