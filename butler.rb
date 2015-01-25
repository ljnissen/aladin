require 'sinatra'
require 'pathname'
 
get "/" do
	dir = "./public/files/"
		@links = Dir[dir+"*"].map { |file|
			file_link(file)
		}.join
	erb :index
end
 
helpers do
 
	def file_link(file)
		filename = Pathname.new(file).basename
		"<a href='#{file}'>#{filename}</a><br/>"
	end
end 

enable :inline_templates

__END__

@@index
<html>
	<head>
	</head>

	<body>
		<h1>Your files, sir...</h1>
		<%= @links %>
	</body>
</html>