// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function set_default_history(id){
    $("#history_number_"+id).DefaultValue("Number");
    $("#history_message_"+id).DefaultValue("Message");
}