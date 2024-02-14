local function toggleApplication(name)
  hs.application.launchOrFocus(name)
end

local function findIndex(list, value)
  for i = 1, #list do
    if list[i] == value then
      return i
    end
  end
end

local function toggleApplications(applications)
  local currentApplication = hs.application.frontmostApplication():name()

  if (currentApplication == "Code") then
    currentApplication = "Visual Studio Code"
  end

  local index = findIndex(applications, currentApplication)
  hs.console.printStyledtext(index)
  index = index and index + 1 or 1
  -- hs.console.printStyledtext(index)

  if (index > #applications) then
    index = 1
  end

  return function()
    if(applications[index]) then
      toggleApplication(applications[index])
      index = index % #applications + 1
    end
  end
end

local function winClose(timer)

  local win = hs.window'Authentication Error'

  if win ~= nil then
    win:close()
  end
  timer:start()
end

local function winExist()
  if hs.window'Authentication Error' ~= nil then
    return true
  else
    return false
  end
end



hs.hotkey.bind({"⌘"}, "1", function() toggleApplication("Brave Browser") end)
hs.hotkey.bind({"⌘"}, "2", function() toggleApplication("Visual Studio Code") end)
-- hs.hotkey.bind({"⌘"}, "3", function() toggleApplication("Microsoft Teams") end)
hs.hotkey.bind({"⌘"}, "3", function() toggleApplication("Microsoft Teams (work preview)") end)
hs.hotkey.bind({"⌘"}, "4", function() toggleApplication("Mail") end)
hs.hotkey.bind({"⌘"}, "5", function() toggleApplication("iTerm") end)
hs.hotkey.bind({"⌘"}, "6", function() toggleApplication("Calendar") end)
hs.hotkey.bind({"⌘"}, "7", function() toggleApplication("Numi") end)
hs.hotkey.bind({"⌘"}, "8", function() toggleApplications({"Brave Browser", "Chromium"})() end)





