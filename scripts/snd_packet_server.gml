///snd_packet_server(socket, buffer);
var socket = argument0; //type of packet we're sending
var buffer = argument1; //Socket to send to (client)

network_send_packet(socket,buffer,buffer_tell(buffer));     //send to socket "sock"
