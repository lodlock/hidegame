/// ReceivedPacket(buffer, socket, inst)

show_debug_message("Received");

// CONSTANTS
TEST = 0;
KEY = 1;
MOUSE = 2;

var buffer = argument[0];
var socket = argument[1];
var inst = argument[2];
    
if(gameStart or debug){
    var msgid = buffer_read(buffer, buffer_u16);
    show_debug_message(inst);
    switch(msgid){
        case KEY:
            //A key has been pressed so read the keypress data from the buffer
            show_debug_message("Key Press");
            var length = buffer_read(buffer, buffer_u16);
            for(i = 0; i < length; i++){
                var key = buffer_read(buffer, buffer_string);
                show_debug_message(key);
                if(inst == 0){ //The Killer!
                if(instance_exists(o_killer))
                    switch(key){
                        case "W":
                            o_killer.vspeed = -11;
                        break;
                        case "A":
                            o_killer.hspeed = -11;
                        break;
                        case "S":
                            o_killer.vspeed = 11;
                        break;
                        case "D":
                            o_killer.hspeed = 11;
                        break;
                    }
                }else if(inst == 1){    //Hider 1
                    if(instance_exists(o_hider))
                    switch(key){
                        case "W":
                            o_hider.vspeed = -9;
                        break;
                        case "A":
                            o_hider.hspeed = -9;
                        break;
                        case "S":
                            o_hider.vspeed = 9;
                        break;
                        case "D":
                            o_hider.hspeed = 9;
                        break;
                        case "SHFT":
                            o_hider.sprint = 1;
                        break;
                    }
                }else if(inst == 2){
                    if(instance_exists(o_hider2))
                    switch(key){
                        case "W":
                            o_hider2.vspeed = -9;
                        break;
                        case "A":
                            o_hider2.hspeed = -9;
                        break;
                        case "S":
                            o_hider2.vspeed = 9;
                        break;
                        case "D":
                            o_hider2.hspeed = 9;
                        break;
                        case "SHFT":
                            o_hider2.sprint = 1;
                        break;
                    }
                }
            }
        break;
        case KEY_RELEASED:
            //A key has been pressed so read the keypress data from the buffer
            show_debug_message("Key Release");
            var length = buffer_read(buffer, buffer_u16);
            for(i = 0; i < length; i++){
                var key = buffer_read(buffer, buffer_string);
                show_debug_message(key);
                if(inst == 0){ //The Killer!
                    if(instance_exists(o_killer))
                    switch(key){
                        case "W":
                            o_killer.vspeed = 0;
                        break;
                        case "A":
                            o_killer.hspeed = 0;
                        break;
                        case "S":
                            o_killer.vspeed = 0;
                        break;
                        case "D":
                            o_killer.hspeed = 0;
                        break;
                    }
                }else if(inst == 1){    //Hider 1
                    if(instance_exists(o_hider))
                    switch(key){
                        case "W":
                            o_hider.vspeed = 0;
                        break;
                        case "A":
                            o_hider.hspeed = 0;
                        break;
                        case "S":
                            o_hider.vspeed = 0;
                        break;
                        case "D":
                            o_hider.hspeed = 0;
                        break;
                        case "SHFT":
                            o_hider.sprint = 0;
                        break;
                    }
                }else if(inst == 2){
                    if(instance_exists(o_hider2))
                    switch(key){
                        case "W":
                            o_hider2.vspeed = 0;
                        break;
                        case "A":
                            o_hider2.hspeed = 0;
                        break;
                        case "S":
                            o_hider2.vspeed = 0;
                        break;
                        case "D":
                            o_hider2.hspeed = 0;
                        break;
                        case "SHFT":
                            o_hider2.sprint = 0;
                        break;
                    }
                }
            }
        break;
        case MOUSE:
            //Use mouse
            show_debug_message("Mouse Data received");
            var kmouse_x = buffer_read(buffer, buffer_u16);
            var kmouse_y = buffer_read(buffer, buffer_u16);
            if(inst == 0){ //Killer
                if(instance_exists(o_killer))
                    o_killer.image_angle = point_direction(o_killer.x, o_killer.y, kmouse_x,kmouse_y);
            }else if(inst == 1){ //Hider 1
                if(instance_exists(o_hider))
                    o_hider.image_angle = point_direction(o_hider.x, o_hider.y, kmouse_x,kmouse_y);
            }else if(inst == 2){ //Hider 2
                if(instance_exists(o_hider2))
                    o_hider2.image_angle = point_direction(o_hider2.x, o_hider2.y, kmouse_x,kmouse_y); 
            }
        break;
        case TEST:
            show_debug_message("Packet received");
            show_debug_message(buffer_read(buffer, buffer_string));
        break;
        }
}
