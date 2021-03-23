local function toggleApplication(name)
  hs.application.launchOrFocus(name)
end

hs.hotkey.bind({"⌘"}, "1", function() toggleApplication("Safari") end)
hs.hotkey.bind({"⌘"}, "2", function() toggleApplication("Visual Studio Code") end)
hs.hotkey.bind({"⌘"}, "3", function() toggleApplication("Slack") end)
hs.hotkey.bind({"⌘"}, "4", function() toggleApplication("Mailspring") end)
hs.hotkey.bind({"⌘"}, "5", function() toggleApplication("iTerm") end)

