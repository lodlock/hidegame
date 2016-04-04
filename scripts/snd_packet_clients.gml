///snd_packet_clients(socket_list, buffer);
socket_list = argument[0];
buffer = argument[1];


for(var i = 0; i < ds_list_size(socket_list); i++){
    network_send_packet(ds_list_find_value(socket_list, i), buffer, buffer_tell(buffer));
}
