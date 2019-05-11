local function toggleApplication(name)
  local app = hs.application.find(name)
  if not app or app:isHidden() then
    hs.application.launchOrFocus(name)
  elseif hs.application.frontmostApplication() ~= app then
    app:activate()
  else
    app:hide()
  end
end

hs.hotkey.bind({"⌘"}, "1", function() toggleApplication("Google Chrome") end)
hs.hotkey.bind({"⌘"}, "2", function() toggleApplication("Visual Studio Code") end)
hs.hotkey.bind({"⌘"}, "3", function() toggleApplication("Slack") end)
hs.hotkey.bind({"⌘"}, "4", function() toggleApplication("Mail") end)
hs.hotkey.bind({"⌘"}, "5", function() toggleApplication("iTerm") end)

