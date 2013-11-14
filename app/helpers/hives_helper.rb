module HivesHelper
#Generaate Gravatar
	def gravatar_for(hive, options = {size: 50})
	g_id = Digest::MD5::hexdigest(hive.email.downcase)
	size = options[:size]
	g_url = "https://secure.gravatar.com/avatar/#{g_id}.png?s=#{size}"
	image_tag(g_url, :alt => hive.name, :class => 'gravatar')
	end
end
