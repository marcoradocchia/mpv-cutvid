local status_ok, mp = pcall(require, "mp")
if not status_ok then
	return
end

local start_stamp = nil
local tmp_file_path = "/tmp/mpv.timestamps"

local function file_exists()
	local f = io.open(tmp_file_path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function format_time()
	local s = mp.get_property_number("time-pos")
	local h = math.floor(s / 3600)
	s = s - (h * 3600)
	local m = math.floor(s / 60)
	s = s - (m * 60)
	return string.format("%02d:%02d:%02d", h, m, s)
end

local function get_stamps()
	if start_stamp then
		local end_stamp = format_time()
		mp.osd_message("Section ended " .. end_stamp)
		-- write start timestamp and encoding duration to tmp file to be processed
		-- by ffmpeg
		local tmpfile = io.open(tmp_file_path, "a+")
		io.output(tmpfile)
		io.write(string.format("%s-%s\n", start_stamp, end_stamp))
		io.close(tmpfile)
		start_stamp = nil
	else
		start_stamp = format_time()
		mp.osd_message("Section started " .. start_stamp)
	end
end

local function cutvid()
	if start_stamp ~= nil then
		mp.osd_message("Missing end section timestamp!")
		return
	elseif not file_exists() then
		mp.osd_message("No section timestamps found!")
		return
	end
	local video_path = string.format("%s/%s", mp.get_property("working-directory"), mp.get_property("path"))
	-- if file exists then at least one section has been written to it
	os.execute(string.format("/usr/local/bin/ffmpeg-cut-merge %s %s", tmp_file_path, video_path))
	mp.osd_message(string.format("Output video at %s", video_path))
end

-- add mappings
mp.add_key_binding("Ctrl+t", "get_stamps", get_stamps)
mp.add_key_binding("Ctrl+p", "cutvid", cutvid)
