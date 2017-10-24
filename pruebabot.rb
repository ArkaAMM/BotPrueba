require "telegram/bot"

token = "215010612:AAHAA5cQqubietorU46MG2Tx4pxkT_ECjTM"
Telegram::Bot::Client.run(token) do |bot|
	bot.listen do |message|
		case message.text
		when "/start" then bot.api.send_message(chat_id: message.chat.id, text: "Bienvenido al bot de prueba de Adrian \n Los comandos son: \n " + "/start : Mensaje de bienvenida\n /saludo : Te saludo\n /map : Te digo mi Ubicaion \n /stop : Me despido de ti")
		when '/saludo' 
			bot.api.send_message(chat_id: message.chat.id, text: "Hola #{message.from.first_name}!")
		when '/stop' 
			bot.api.send_message(chat_id: message.chat.id, text: "Adios, #{message.from.first_name}!")
		when '/map'
			bot.api.send_location(chat_id: message.chat.id, latitude: 40.579554, longitude: -3.298362)
		else
			bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name}, no se que significa el comando: #{message.text}") 
		end
	end
end
