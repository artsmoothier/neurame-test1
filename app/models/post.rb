class Post < ActiveRecord::Base

	belongs_to	:user
	has_many	:comments
	validates	:category, :inclusion => {:in => ["Charged","Free"], :message => "Choice category"}
	validates	:title, :presence => {:message => "제목을 반드시 입력해주세요"}
end
