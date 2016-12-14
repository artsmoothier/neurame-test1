class User < ActiveRecord::Base

	has_many	:posts
	has_many	:comments
	validates	:username, :presence => {:message => "You missed your username!"}
	validates	:username, :uniqueness => {:message => "Username already exists."}
	validates	:password, :length  => {:minimum => 6, :too_short => "More than 6 words"}
	validates	:email, :presence => {:message => "You missed your email"}
	validates	:email, :uniqueness => {:message => "Email already exists."}

end
