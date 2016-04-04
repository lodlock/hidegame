//send_client_map(socket_list, map, key);
socket_list = argument[0];
map = argument[1];

for(var i = 0; i < ds_list_size(socket_list); i++){
    sock = ds_list_find_value(socket_list, i);
    
    var buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u16, MAP);
    buffer_write(buffer, buffer_u16, map);
    
    show_debug_message("Sending map");
    
    network_send_packet(sock, buffer, buffer_tell(buffer));
    
    buffer_delete(buffer);
}
