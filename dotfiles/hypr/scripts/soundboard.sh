#!/bin/fish
default_mic = $(pactl get-default-source)
pactl load-module module-null-sink sink_name=soundboard_sink sink_properties=device.description=Soundboard_Audio_Sink
pactl load-module module-loopback source=soundboard_sink.monitor
pactl load-module module-null-sink sink_name=combined_sink sink_properties=device.description=Combined_Audio_Sink
pactl load-module module-loopback source=virtual_sink.monitor sink=combined_sink
pactl load-module module-loopback source=$default_mic sink=combined_sink
exit
