-- UTILITY FUNCTIONS
-- FROM http://lua-users.org/wiki/SaveTableToFile

local function exportstring( s )
    return string.format("%q", s)
end

function table.save(  tbl,filename )
   local charS,charE = "   ","\n"
   local file,err = io.open( filename, "wb" )
   if err then return err end
   -- initiate variables for save procedure
   local tables,lookup = { tbl },{ [tbl] = 1 }
   file:write( "return {"..charE )
   for idx,t in ipairs( tables ) do
      file:write( "-- Table: {"..idx.."}"..charE )
      file:write( "{"..charE )
      local thandled = {}
      for i,v in ipairs( t ) do
         thandled[i] = true
         local stype = type( v )
         -- only handle value
         if stype == "table" then
            if not lookup[v] then
               table.insert( tables, v )
               lookup[v] = #tables
            end
            file:write( charS.."{"..lookup[v].."},"..charE )
         elseif stype == "string" then
            file:write(  charS..exportstring( v )..","..charE )
         elseif stype == "number" then
            file:write(  charS..tostring( v )..","..charE )
         end
      end
      for i,v in pairs( t ) do
         -- escape handled values
         if (not thandled[i]) then
            local str = ""
            local stype = type( i )
            -- handle index
            if stype == "table" then
               if not lookup[i] then
                  table.insert( tables,i )
                  lookup[i] = #tables
               end
               str = charS.."[{"..lookup[i].."}]="
            elseif stype == "string" then
               str = charS.."["..exportstring( i ).."]="
            elseif stype == "number" then
               str = charS.."["..tostring( i ).."]="
            end
            if str ~= "" then
               stype = type( v )
               -- handle value
               if stype == "table" then
                  if not lookup[v] then
                     table.insert( tables,v )
                     lookup[v] = #tables
                  end
                  file:write( str.."{"..lookup[v].."},"..charE )
               elseif stype == "string" then
                  file:write( str..exportstring( v )..","..charE )
               elseif stype == "number" then
                  file:write( str..tostring( v )..","..charE )
               end
            end
         end
      end
      file:write( "},"..charE )
   end
   file:write( "}" )
   file:close()
end

function table.load( sfile )
   local ftables,err = loadfile( sfile )
   if err then return _,err end
   local tables = ftables()
   for idx = 1,#tables do
      local tolinki = {}
      for i,v in pairs( tables[idx] ) do
         if type( v ) == "table" then
            tables[idx][i] = tables[v[1]]
         end
         if type( i ) == "table" and tables[i[1]] then
            table.insert( tolinki,{ i,tables[i[1]] } )
         end
      end
      -- link indices
      for _,v in ipairs( tolinki ) do
         tables[idx][v[2]],tables[idx][v[1]] =  tables[idx][v[1]],nil
      end
   end
   return tables[1]
end
-- END UTILITY FUNCTIONS

store_dir = filesystem.store_dir() .. '\\timely\\'
if not filesystem.is_dir(store_dir) then
    filesystem.mkdirs(store_dir)
end

local max_timer_time = 86400000
local all_timer_lists = {}
local parse_all_timer_files

function create_timer_entry(data)
    local data_copy = data
    local timer_name = data['timer_name']
    local timer_desc = data['timer_desc']
    local timer_commands = data['timer_commands']
    local timer_delay = data['timer_delay']
    local this_timer_path = store_dir .. '\\' .. timer_name .. '.lua'
    local fmt_name = timer_name:gsub(' ', '')
    if all_timer_lists[timer_name] == nil then
        local this_timer_root = menu.list(menu.my_root(), timer_name, {'timely' .. fmt_name}, timer_desc)
        all_timer_lists[timer_name] = this_timer_root
        menu.toggle_loop(this_timer_root, "Run timer", {"runtimer" .. timer_name}, "", function(click_type)
            menu.trigger_commands(timer_commands)
            util.yield(timer_delay)
        end)

        menu.text_input(this_timer_root, "Description", {"timelysetdesc" .. fmt_name}, "", function(on_input)
            timer_desc = on_input
            data_copy['timer_desc'] = on_input
            table.save(data_copy, this_timer_path)
            menu.set_help_text(this_timer_root, timer_desc)
        end, timer_desc)

        menu.text_input(this_timer_root, "Command(s)", {"timelysetcommands" .. fmt_name}, "The commands for this timer. You can specify multiple by putting semicolons in between each.", function(on_input)
            timer_commands = on_input
            data_copy['timer_commands'] = on_input
            table.save(data_copy, this_timer_path)
        end, timer_commands)

        menu.slider(this_timer_root, "Timer delay (MS)", {fmt_name .. "delay"}, "The timer delay, in milliseconds. 1000 ms = 1 second.", 0, max_timer_time, 100, 1, function(s)
            timer_delay = s
            data_copy['timer_delay'] = s
            table.save(data_copy, this_timer_path)
        end)

        menu.action(this_timer_root, "Delete timer", {}, "Delete this timer\'s file.", function(click_type)
            ok, err = os.remove(this_timer_path)
            if not ok then
                util.toast("Timer could not be removed: " .. err)
            else
                all_timer_lists[timer_name] = nil
                util.toast("Timer removed.")
                menu.delete(this_timer_root)
                parse_all_timer_files()
            end
        end)
    end
end

function parse_all_timer_files()
    for i, path in ipairs(filesystem.list_files(store_dir)) do
        if string.match(path:gsub(store_dir, ''), '.lua') then
            local timer_data = table.load(path)
            create_timer_entry(timer_data)
        end
    end
end

local create_timer_root = menu.list(menu.my_root(), "Create new timer", {'timelycreate'}, "")
----
local timer_divider = menu.divider(menu.my_root(), "Timers")

local new_timer_name = "My new timer"
menu.text_input(create_timer_root, "Name", {"timelysetname"}, "", function(on_input)
    new_timer_name = on_input
end, new_timer_name)

local new_timer_desc = "Your description goes here."
menu.text_input(create_timer_root, "Description", {"timelysetdesc"}, "", function(on_input)
    new_timer_desc = on_input
end, new_timer_desc)

local new_timer_commands = "crashall"
menu.text_input(create_timer_root, "Command(s)", {"timelysetcommands"}, "The commands for this timer. You can specify multiple by putting semicolons in between each.", function(on_input)
    new_timer_commands = on_input
end, new_timer_commands)

local new_timer_delay = 100
menu.slider(create_timer_root, "Timer delay (MS)", {"timelysetdelay"}, "The timer delay, in milliseconds. 1000 ms = 1 second.", 0, max_timer_time, 100, 1, function(s)
    new_timer_delay = s
end)

menu.action(create_timer_root, "Create timer", {}, "Create and save this timer as a file.", function(click_type)
    local new_timer_data = {
        timer_name = new_timer_name,
        timer_desc = new_timer_desc,
        timer_commands = new_timer_commands,
        timer_delay = new_timer_delay
    }
    local timer_path = store_dir .. '/' .. new_timer_name .. '.lua'
    if filesystem.exists(timer_path) then
        util.toast("A timer with that name already exists.")
        return 
    else
        table.save(new_timer_data, timer_path)
        parse_all_timer_files()
        menu.trigger_commands("timely" .. new_timer_name:gsub(' ', ''))
        util.toast("Timer created! I\'ve opened it for you :)")
    end
end)

util.create_thread(function()
    while true do
        parse_all_timer_files()
        util.yield()
    end
end
)

util.keep_running(100)
