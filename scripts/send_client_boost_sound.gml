//snd_client_boost_sound(sock)
sock = argument[0];

var buffer = buffer_create(256, buffer_grow, 1);
buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u16, o_server.SND);
buffer_write(buffer, buffer_string, "boost");

network_send_packet(sock, buffer, buffer_tell(buffer));

buffer_delete(buffer);

