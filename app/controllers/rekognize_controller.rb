class RekognizeController < ApplicationController

	def face_detect
		@array = []
		@stuff = []
		@photos = Photo.all
		@photos.each do |p|
			@stuff.push(p.url)
		end
		# @stuff = Photo.find_by_sql("SELECT url FROM photos;")
		@stuff.each do |url|
			@array.push(HTTParty.post("http://rekognition.com/func/api/",
				{body:{api_key: ENV["REK_API_KEY"],
					api_secret: ENV["REK_API_SECRET"],
					jobs: "face_part_gender_emtion_race_age",
					urls: url,
					num_return: "3"}}))
		end
	end

	def face_add
		@add = HTTParty.post("http://rekognition.com/func/api/",
			{body:{api_key: ENV["REK_API_KEY"],
				api_secret: ENV["REK_API_SECRET"],
				jobs: "face_add",
				urls: "http://i.imgur.com/Xqe9yxh.jpg",
				num_return: "3"}})
	end

	def face_train
		@train = HTTParty.post("http://rekognition.com/func/api/",
			{body:{api_key: ENV["REK_API_KEY"],
				api_secret: ENV["REK_API_SECRET"],
				jobs: "face_train",
				urls: "http://i.imgur.com/Xqe9yxh.jpg",
				num_return: "3"}})
	end

	def face_recog
		@recog = HTTParty.post("http://rekognition.com/func/api/",
			{body:{api_key: ENV["REK_API_KEY"],
				api_secret: ENV["REK_API_SECRET"],
				jobs: "face_recognize",
				urls: "http://i.imgur.com/Xqe9yxh.jpg",
				num_return: "3"}})
			
	end

	def scene_match
		@scene = HTTParty.post("http://rekognition.com/func/api/", 
			{body:{api_key: ENV["REK_API_KEY"],
				api_secret: ENV["REK_API_SECRET"],
				jobs: "scene_understanding_3",
				urls: "http://i.imgur.com/AG9l86D.jpg",
				num_return: "3"}})
	end

end
