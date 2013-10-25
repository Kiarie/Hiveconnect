module HivesHelper
#Generaate Gravatar
	def gravatar_for(hive)
	g_id = Digest::MD5::hexdigest(hive.email.downcase)
	g_url = "https://secure.gravatar.com/avatar/#{g_id}.png"
	image_tag(g_url, :alt => hive.name, :class => 'gravatar')
	end
end
