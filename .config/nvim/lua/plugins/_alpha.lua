return
{

  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    _Gopts = {
      position = 'center',
      hl = 'Type',
      wrap = 'overflow',
    }

    -- DASHBOARD HEADER

    local function getGreeting(name)
      local tableTime = os.date '*t'
      local datetime = os.date ' %Y-%m-%d-%A   %H:%M:%S '
      local hour = tableTime.hour
      local greetingsTable = {
        [1] = '  it\'s sleep time',
        [2] = '  debatably still sleep time',
        [3] = '  who doesn\'t love a nap?',
        [4] = '  could go to sleep early',
        [5] = '󰖔  within your rights to go to sleep',
      }
      local greetingIndex = 0
      if hour == 23 or hour < 7 then
        greetingIndex = 1
      elseif hour < 12 then
        greetingIndex = 2
      elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
      elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
      elseif hour >= 21 then
        greetingIndex = 5
      end
      return datetime .. '  ' .. greetingsTable[greetingIndex] .. ', ' .. name
    end

    local logos = {
      [[
⠀⠀⠀⣴⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣾⣿⣿⣿⣦⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⡿⢏⣝⠛⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⠆⠀⠀⠀⠀
⠀⠀⠀⢻⡟⠻⣇⠀⠁⠀⠈⠳⡀⠀⠀⠀⢀⣤⡶⠝⠛⠫⢖⣄⠀⢀⠀⡀⠀⢇⠾⠋⠉⠉⠛⠛⠻⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠸⡇⠀⠉⠈⠀⠀⠀⠀⠙⢦⡀⢀⢾⠋⣀⣤⡾⢾⠶⣽⣷⡘⠐⡅⢦⠋⠀⠀⠀⠀⠀⠀⣠⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠑⠙⠚⠣⠼⣟⣁⡀⣠⣤⠈⢳⣇⣰⠜⠁⠀⠼⠀⠀⠀⠀⢤⣿⡿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢱⡠⡀⣤⢪⡁⣀⠀⠀⠀⠀⠀⠀⠀⠀⠄⣔⣰⢍⡁⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⠁⠈⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡜⠀⢠⣭⡓⣿⠏⣀⣤⣤⣤⣄⡀⠀⠀⠀⠈⠉⢛⣃⣀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢿⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⠏⠀⠀⠀⠀⠈⢨⣾⠟⠉⢀⣀⣉⣙⠓⢦⡀⣠⠾⠛⣛⡛⠻⢶⣤⡀⠀⠀⠀⠨⣴⣌⣆⠀⠀⠀⠀⠀⠀
⠀⠀⡰⠏⢀⠀⠀⠀⠀⠀⡜⠁⠀⣰⢟⣶⣶⣦⢻⡆⠉⠁⢠⣾⣷⣮⡳⡀⠈⠛⢆⠀⠀⠀⠹⡦⠸⣄⠀⠀⠀⠀⠀
⠀⢰⠃⠀⠀⠀⠀⠀⠀⠔⣇⠀⠀⢹⣮⡛⡿⠋⣞⣡⣄⣀⠘⢎⠿⠿⣷⠃⠀⠀⢸⡀⠀⠀⣀⠀⠀⢣⠀⠁⠀⠀⠀
⠀⡜⠠⠀⠀⠀⠀⢼⣿⢒⢽⠦⡀⠀⠀⠀⠈⣸⣿⣿⣿⣿⣷⡀⠉⠈⠁⠀⢀⣾⣿⣿⣿⡼⢾⠀⡄⢸⠀⡄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢰⣅⡀⣄⣼⠿⠈⠀⠈⠻⣿⣿⣿⣿⣿⣿⠗⠉⠉⠈⠉⠛⠛⢿⣿⡿⢡⠀⢀⡷⢸⡇⠀⠀⠀⠀
⠀⢄⠀⢀⠀⠀⠀⡀⠉⢉⠟⠁⠀⠀⠀⠀⠀⠀⠉⠛⠛⠫⠅⠠⣤⣄⠀⠀⠀⠀⠘⡄⡜⠀⠃⢈⢣⣾⠇⠂⠀⠀⠀
⠀⢹⠀⢘⡆⠀⠀⢇⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⡾⠟⠉⠀⠀⠀⠀⢠⣧⠁⠀⢀⡞⣼⣿⢠⠀⠀⠀⠀
⠀⠅⣧⠀⢣⠀⠀⠸⡀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠉⠀⠀⠀⠀⠀⠀⡀⣾⡏⠀⣠⡟⢠⣿⡇⠎⡄⠀⠀⠀
⠀⣙⡜⣧⡀⠣⡀⠀⢿⣦⣳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣴⣾⠟⠠⣰⠏⣠⣿⠟⢸⢐⠀⠀⠀⠀
⠀⢸⡁⢸⣦⡀⠳⡀⠸⣿⣟⡿⢷⣦⣤⣴⣤⣴⣤⣀⣀⣠⣬⣤⣶⣿⣿⣿⠛⢁⣺⡿⢃⣼⣿⠻⡄⠆⠀⠀⠀⠀⠀
⠀⠥⠰⢰⡇⡹⣄⢱⣿⣿⡟⢱⡐⠈⢹⣻⢿⢿⣿⡿⠿⣿⢿⢿⠛⢻⢹⢹⢻⠾⠿⠵⡿⢋⡇⠸⠀⠂⠀⠀⠀⠀⠀
⢀⠤⡼⢢⢰⠁⣯⠻⠿⠟⢰⡋⡇⡞⢦⢿⢘⣶⠘⣇⡔⡣⠜⡘⣆⠎⠜⡎⡜⡠⠇⡆⡇⢨⡼⢇⡇⠀⠀⠀⠀⠀⠀
⠬⢘⡅⠘⠨⠂⡍⢟⢱⡜⢷⢰⢁⢧⢮⢸⠋⣆⠸⣼⢱⣙⡌⡇⡬⢡⢧⠱⠁⣧⢣⣄⠁⡇⡁⠘⠀⠀⠀⠀⠀⠀⠀
⠀⡇⡕⢴⠃⠀⢻⠈⠇⢻⢌⡨⡋⡾⣌⢾⢸⢹⣆⢇⠿⡇⣶⢷⡇⠼⣧⠘⡎⠋⢇⠸⢸⠰⠹⠄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠂⠀⠀⠃⠀⠀⠅⠈⡜⠁⡇⠘⠀⣿⠰⡁⠹⠀⢱⠟⡆⠀⠆⢸⠈⠈⠀⠘⠀⠀⠀⡊⠀⠈⠀⠀⠀⠀⠀⠀
       create something beautiful
      ]],
      [[
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⢠⠀⠀⠀⠀⠀⠀⣠⠠⠀⠀⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⡀⠀⠤⠀⠀⠀⠄⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡀⠐⠀⣆⠀⠀⠀⠀⠀⠐⠠⠀⠀⠑⢈⠓⠄⠠⢀⡀⢀⠀⠀⠀⠀⠀⢀⡀⡀⣀⠢⣄⡔⣁⣀⠢⠀⠑⠀⠀⢀⣞⠈⠀⣴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⢐⡈⢻⠢⠀⠀⠀⠛⢉⠘⠒⠂⠠⠄⢀⠀⢀⠀⠀⠀⠈⠉⠉⠁⠀⠀⠀⠀⠀⢀⢔⣀⣀⠀⠀⠀⠀⠀⢀⠺⠈⢴⣕⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢸⢆⠶⡆⢀⠀⡀⡀⢊⣉⠙⠒⠮⢀⣄⡀⠀⠈⠁⠂⠠⠤⠀⠀⠀⢠⠄⢒⠡⠏⠁⠀⡉⡉⡉⠒⠄⢀⠌⠚⢸⣇⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠪⠿⡷⠘⠀⠡⠜⣰⣩⣦⣭⣠⣀⡀⠙⠙⠓⠠⠀⡄⠀⢀⣦⠀⡀⠈⢀⠀⣁⣀⣴⣦⣴⣬⣩⣄⡒⠁⣠⠙⢿⠁⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠢⠁⡀⣅⡀⣺⣿⣿⣿⣿⣿⣿⣽⣶⣶⣶⣶⣿⣶⡯⢍⡻⠿⣿⣿⣿⣿⣿⣿⣽⣿⣯⡛⡿⢿⡄⢠⡎⢀⡔⠪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠇⠿⢧⠉⠹⣿⡿⣻⣯⣟⣛⡭⣿⣿⣿⣿⣿⡷⠦⠴⣿⡿⡿⢿⣧⡝⣛⣯⣿⠿⢳⣗⠁⠘⡟⠃⠺⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢲⣾⠀⢸⠀⠀⠉⠳⢦⡼⠍⠽⢋⣏⠳⣼⣿⣿⠀⠀⠀⢸⣿⡷⢿⣿⣙⠫⠅⢁⣰⠯⠀⠀⢀⠇⠀⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠀⠘⣆⠀⠀⠀⠀⠉⠤⠔⠋⠈⢀⣾⣿⠇⠀⠀⠀⠀⢻⣷⡈⠑⠓⠱⠲⠚⠃⠀⢀⣠⡞⠀⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡹⣳⢤⣤⣀⣀⣀⣄⣤⠼⢿⡛⠉⠉⠀⠀⠀⠀⠈⠙⠻⠶⢤⠤⣦⣴⣴⠶⠟⠑⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢱⣿⢿⡉⠋⠈⠀⠀⢀⣠⣿⠛⠀⠀⠀⠀⠀⠀⠀⠀⢷⣦⠀⠀⠀⠀⢀⠀⣌⢼⠼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣸⣹⡇⠀⠀⠀⠀⣾⣿⣇⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⣿⣷⣀⠀⠀⠀⢀⡏⣀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠠⠁⢳⢗⣿⠈⣠⠰⣸⠟⠈⢿⣿⣦⣄⣀⠀⣄⣁⣠⣶⣾⣄⢙⣷⠂⢀⡀⣸⢬⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⠆⠀⠍⣿⣮⠜⠁⣴⣼⣾⣿⣿⣿⣿⣿⣿⣷⢿⣿⣿⣿⣿⣷⣿⣯⢳⢒⡿⣃⢀⢠⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣾⡐⠆⢿⡇⡰⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢘⠟⢆⣬⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⡇⢇⢿⡧⣴⣿⣿⣿⠿⣿⢿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣟⠛⣿⣿⣿⣸⢥⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠈⢿⣗⢻⣽⣿⡏⠀⠀⠀⢀⣀⣤⣤⣤⣤⣀⡄⡀⠆⡄⢰⣾⣯⣭⢮⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠈⣿⡜⣽⣿⣧⡎⠔⣰⣽⣿⣿⣿⣿⣿⣿⣿⣦⣿⣶⣿⣿⣿⣵⠃⣟⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠠⠘⢀⢺⡷⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⡪⣫⣿⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠐⠀⡑⢊⠌⣻⣧⣽⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣵⣿⡯⣡⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀
⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣔⠥⣉⠻⢹⡿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣥⣚⡹⢟⣿⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                          wen she suckin yo balls and you
                               and you a gangsta

      ]],
      [[
  .-..                            ___      ___           ___
 /    \                         (   )    (   )         (   )
 | .`. ; ___ .-.    .--.   .---. | |   ___| |.-.   .--. | |.-.
 | |(___(   )   \  /    \ / .-, \| |  (   | /   \ /    \| /   \
 | |_    | ' .-. ;|  .-. (__) ; || |  ' / |  .-. |  .-. |  .-. |
(   __)  |  / (___|  | | | .'`  || |,' /  | |  | | |  | | |  | |
 | |     | |      |  |/  |/ .'| || .  '.  | |  | | |  | | |  | |
 | |     | |      |  ' _.| /  | || | `. \ | |  | | |  | | |  | |
 | |     | |      |  .'.-; |  ; || |   \ \| '  | | '  | | '  | |
 | |     | |      '  `-' ' `-'  || |    \ ' `-' ;'  `-' ' `-' ;
(___)   (___)      `.__.'`.__.'_(___ ) (___`.__.  `.__.' `.__.
 ⠛⠛⠛⠛⠛⠛⠛⠛⠿⢿⢿⣿⠿⣿⢿⡿⢿⠻⠿⡻⣿⠿⠟⠟⠛⠛⠛⠿⢿⣟⠿⠿⠿⢟⡿⠿⠛⠛⠛⠻⠿⣿⡻⠟⠿⠛⠛⠛⠛⠻⠛⢻⠛⠛⠛⠛⠛⠛⠛⠛
         ⠀⠀⠠⣿⠀⢠⣿⡟⠀⠀⢠⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⡀⣴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⠀⠀⠀⠀⠀⠀⢠⠋
         ⠀⠆⣥⡟⠄⠈⠋⠀⠀⠀⡾⠁⠀⠀⠀⠀⢀⣴⣿⣿⢷⣄⠀⡿⠁⠀⣰⣾⢷⣦⡄⠀⠀⠀⠀⠈⣧⠀⠀⠀⠀⠀⢧⠀
         ⠀⠃⢸⡇⠀⠀⠀⠀⠀⠀⣇⠀⠀⠀⠀⠀⢸⣿⣿⣿⢯⡿⠀⡯⠀⢸⣿⢾⣿⣞⣿⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢸⠀
         ⠀⠀⠎⢷⡀⠠⢠⡖⠛⠽⡟⣦⠀⠀⠀⠀⠀⠙⠷⠿⠟⠁⣴⠛⠒⢦⠻⢯⣿⠾⠋⠀⠀⠀⠀⣀⣼⠤⢤⣀⠀⢀⡜⠀
         ⠀⠀⠀⢠⣷⠀⢿⠋⠘⣭⠤⢸⣄⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⠃⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠐⡇⠌⠥⠄⠬⣧⢸⡀⠀
         ⠀⠀⠀⣹⠃⠣⠀⠃⠀⠈⢷⡀⠉⠳⢤⣄⣀⣀⣀⣤⠶⠋⠈⠀⡴⠛⠢⣄⡀⠀⠀⠀⢀⣤⠞⠉⢠⠟⠃⣰⠃⠀⡇⠀
         ⠀⠀⠀⢿⡀⠀⠀⠀⠀⠀⠈⠳⣄⡀⠁⠀⠈⠉⠁⠀⠀⠀⠀⠈⠀⠀⠀⠀⠉⠉⠉⠉⠉⠀⣀⡴⠋⠀⠀⠁⠀⠀⡇⠀
         ⠀⠀⠀⠊⠷⡄⠀⠀⠀⠀⣀⠀⠈⢛⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠴⠚⠁⠀⠀⠀⠀⠀⠀⡰⠁⠀
         ⠀⠀⠀⠀⠀⡿⠀⠀⠀⡼⡿⠀⠀⠀⠀⠀⠉⠙⠓⡖⠲⠶⢶⠶⢶⠖⠒⠚⡟⠉⠁⠀⠀⠀⢀⡴⣛⠆⠀⠀⢸⠁⠀⠀
 𝓯𝓻𝓮𝓪𝓴bob 👅 ⢸⡇⠀⠀⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠘⠧⣤⣀⣸⠀⢸⣀⣠⣤⠟⠀⠀⠀⠀⠀⡾⢢⡹⠁⠀⠀⢈⠇⠀⠀
         ⠀⠀⠀⠀⠘⣧⠀⠀⠀⠀⠀⣀⣴⠄⠀⠀⠀⠀⡀⠀⠉⠉⠉⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⢧⠚⠃⠀⠀⠀⣸⠄⠀⠀
         ⠀⠀⠀⠀⠀⣸⢯⡀⠀⠀⣰⢻⣔⡏⠀⠀⠀⠀⠈⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⡅⠀⠀⠀
         ⠀⠀⠀⠀⠀⡏⢨⡗⠀⠀⢾⡧⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⠀⠀⠈⡆⢧⠀⠀⠀
         ⠀⠀⠀⠀⠀⡏⠸⣅⠀⢀⣀⣰⠤⠤⣄⠄⠀⣀⣠⠤⠤⣄⡀⠀⠀⢀⣀⣀⣀⠀⠀⠀⠀⠀⣟⣁⠀⠀⠀⣇⢸⠀⠀⠀
         ⠀⠀⠀⠀⠀⢿⣄⣹⡏⠉⠁⠀⠀⠀⠈⠉⠉⠛⢦⣀⠀⣀⣽⣷⣾⣏⠀⢀⣨⠟⠛⠛⠋⠉⠀⠀⠉⠛⣞⣁⡼⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⢸⡄⣇⣀⣀⢀⡀⡀⢀⠀⡀⢀⠀⢈⠉⠁⣸⣿⣯⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠇⡇⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠸⡇⢹⡭⢽⣯⣭⣭⡏⠛⣯⣭⣭⣭⣯⢭⣿⣳⣻⣯⣿⣯⣿⣽⡏⠹⣽⣭⣭⣭⡿⣹⠀⡇⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⣿⠸⣷⣩⠛⡭⢛⢍⡂⠍⡩⢉⠍⡹⣜⢿⣗⣿⠏⣉⠙⠏⡉⢅⡈⢋⠫⠽⣋⠻⣿⢨⠇⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠸⡆⢿⣶⣽⣔⣫⣲⣬⣑⣤⢃⡜⣠⢍⣲⢽⡻⣆⣱⣬⣂⣑⣢⣬⣧⣮⣵⣞⣷⡇⣸⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⢰⡏⠘⣮⣇⠀⠈⠉⣿⣫⣝⣯⣝⡯⠉⠉⠉⠉⠉⠉⢿⣭⣿⣏⣧⠿⠀⠀⡞⡵⠀⢹⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⣿⢰⡈⢷⡇⠀⠀⠀⠀⠉⢹⠉⣇⠀⠀⠀⠀⠀⠀⠀⠀⡎⢠⠇⠀⠀⠀⠀⢳⡽⢀⡌⡇⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⢻⡌⢧⡾⢿⣦⠀⠀⠀⠀⠸⡇⢸⠀⠀⠀⠀⠀⠀⠀⢰⡃⣸⠀⠀⠀⠀⣠⣻⢧⡼⠁⡇⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠈⠳⣤⣙⣯⠇⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⣼⣿⡇⠀⠀⠀⠀⢹⣳⡞⢠⠞⠁⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⣯⣭⣇⠀⠀⠀⠀⠀⠀⡷⠶⡇⠀⠀⠀⠀⠀⠉⠉⠁⠁⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⠀⣀⡏⠀⣸⠀⠀⠀⠀⠀⢠⡇⠀⣳⣄⢀⣤⣤⣤⡀⠀⠀⠀𝓯𝓻𝓮𝓪𝓴𝔂 👅💦💦
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣶⣿⠇⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⡿⢿⡿⠟⠀⠀⠀⠀⠀⠐⠛⠿⠟⠿⢿⣿⣿⡿⠟⠀⠀⠀

                            FREAKYbob
      ]],
      [[
⠀⠀⠀⠀⠀⠀⠀⠙⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⡆⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣾⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣷⡦⠀⠀⠀⠀⢰⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠃⣠⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣆⠀⠀⠀⣾⣿⣿⣿⣷⠄⠀⠰⠤⣀⠀⠀⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠃⢺⣿⣿⣿⣿⡄⠀⠀⣿⣿⢿⣿⣿⣦⣦⣦⣶⣼⣭⣼⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣷⡆⠂⣿⣿⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢙⣿⣿⣿⣿⣷⠸⣿⣿⣿⣿⣿⣿⠟⠻⣿⣿⣿⣿⡿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⢿⣿⣿⣿⣿⡄⣿⣿⣿⣿⣿⣿⡀⢀⣿⣿⣿⣿⠀⢸⣿⣿⠅⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢐⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⡀⣠⣾⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠠⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣻⣿⣿⣿⣿⣿⡟⠋⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠙⢿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⠿⢿⡿⠛⠋⠁⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣅⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⡟⠃⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢻⣿⣿⣿⣿⣿⣤⡀⠀⠀⠀
⠀⠜⢠⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣦⠄⣠⠀
⠠⢸⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠛⣿⣿⣿⡿⠏⠀⠀⠀⠀⠀⠀⢳⣾⣿⣿⣿⣿⣿⣿⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿
⠀⢨⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⡿⡿⠿⠛⠙⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠏⠉⠻⠿⠟⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
               eek! yiik, even!
      ]],
      [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⡿⣿⣻⢿⣻⣟⡿⣯⢿⣹⢯⣿⡹⣏⡿⡽⣯⢽⣫
⣿⣿⣇⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣽⣿⡾⣷⡿⣾⢷⡿⣽⣯⢷⣻⢯⣟⣾⡽⢏⣾⢯⣟⣼⣳⢯⣟⣵⢫⡞⣶
⣿⣿⣿⣇⠀⠙⣝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣽⣿⣻⣾⣿⣿⣽⣿⣿⣻⣷⣯⡟⣯⣟⣾⢳⣽⡟⣯⣷⣞⣷⣯⣿⣼⣮⣷⣿⠋
⣿⣿⣿⣿⠷⠀⠉⠛⠹⠻⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡿⣿⣻⣿⣿⢿⣿⡿⣟⣿⢿⣿⢿⣿⣛⣿⢿⣻⣟⡿⣿⡻⣟⡿⣻⠿⠉⠀⠀
⣿⣿⣿⣿⣯⠄⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⢿⣟⣷⢿⣟⡿⣟⣯⢟⡿⣼⡿⣣⡿⣩⣿⡽⢾⣹⠣⠷⠑⠈⠁⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣭⣛⡒⠦⡀⠀⠀⠀⠀⠀⠀⠉⠛⠿⠿⠿⢿⢿⡿⣿⣿⡿⠋⠉⠏⠃⠸⣷⣻⡘⢓⢩⡁⠙⠁⠈⠈⠽⠯⠊⠁⠀⠉⠀⠋⠚⠛⠘⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⡍⣉⣽⣶⢄⡀⠀⠀⠀⠀⠀⢄⠀⠀⠀⣏⠈⠉⠀⠀⠈⠳⠖⠉⠀⢯⣇⣿⣿⡏⠃⠰⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀
⣿⣿⣿⣿⣿⣿⣿⣛⡛⠟⡽⢟⠃⡀⢀⣠⡆⠀⠀⠀⢀⠄⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠃⣾⠃⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⣿
⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣖⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡹⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢥⣠⣴⣾⣿⣿⣿⣷⣦⣤⡀⠀⠀⠀⠀⠀⠀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣶⣶⣄⡀⠀⠀⠀⢨⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⢭⢞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⢳⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⠝⠁⠀⠀⠀⢸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣼⡿⢫⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⢸⣟⡽⠄⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣧⠀⠈⠐⠆⠴⣽⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⢰⣿⣿⣿⣿⣿⣿⣿⣿⣟⢻⣿⣿⣿⡇⠀⠀⢸⡟⡆⠀⠈⠁⣾⡂⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⡇⠀⠀⠀⠀⢋⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠘⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⢘⣰⠃⠀⠀⣸⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⠀⠀⠀⠀⢘⡻⢿⡛
⣿⣿⣿⣿⣿⣿⣿⣛⡀⠀⠀⠈⠫⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡀⣠⣾⢷⡲⣴⣠⠤⠉⠁⠀⠀⠀⠀⠀⠀⠀⢸⣼⢻⢿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⢀⡄⢿⣷⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣳⢗⣖⣤⣄⡀⠀⠈⠉⠉⠉⠉⠉⢰⣿⣿⣯⣷⡿⣫⠏⢟⣿⠍⠂⠀⠀⠀⢰⡗⢠⣀⠀⠐⣯⡿⣿⠀⠀⠀⠈⠉⠈⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠁⠀⢩⣿
⣿⣿⣿⣿⣿⣿⣏⣿⣟⢯⡜⡳⠖⣻⣿⣦⣄⠀⠀⠀⢀⣼⣯⣿⡿⣯⣷⣻⡮⣭⠙⠀⠀⠀⠀⠐⠐⠀⠐⣿⠆⠰⣻⣹⢶⡣⠀⠀⢀⣀⣤⡀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣷⣹⣾⣯⣽⡹⣋⣟⢵⣹⣕⣧⣴⢴⡾⣿⣻⣽⡿⣝⣷⢯⣷⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢀⠀⠙⠛⢚⢳⣆⡀⣀⢻⣻⡵⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣷⣟⢷⢪⢮⣗⢾⡴⣻⠽⣝⡽⢏⡷⣟⡿⣾⠿⠡⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠈⠀⠀⠀⠈⠁⠓⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣟⣯⣷⢿⣯⣿⣳⠾⣭⣹⢶⠧⠗⠁⠉⣷⣻⣽⣻⢞⡳⡞⠂⠀⠀⠀⢰⣾⠿⡏⠛⢿⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⠀⠀⠈⠿⠋⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡲⡝⣮⢳⣭⣗⡯⢾⢾⣯⠅⠀⠀⠈⠀⠙⠿⢿⡿⣷⣷⣶⡤⣄⣴⣿⣯⣽⣽⣷⣯⠷⠇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠰⠀⠀⠀⠀⢀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣝⡴⣻⣋⣛⡗⢿⣿⣶⣾⢄⣦⠄⠀⠀⠀⠀⠉⠛⣿⣿⡾⢍⣹⡭⡖⢥⠛⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠲⠀⠀⣰⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣽⣱⣾⢟⠈⠉⠉⠛⠘⠋⠁⠀⠀⠀⠀⠀⠀⠸⡿⣭⢋⣾⢿⣴⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣻⣭⣟⣟⡟⡟⣾⣾⣶⣶⣶⣶⡇⠀⠀⠀⠀⠀⠀⠈⢺⣧⣾⣯⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣯
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⠿⣻⢷⣟⣀⣷⣁⡈⠏⢋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣟⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡷⡃
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣾⣵⢿⣿⣾⣸⣽⣯⡿⣿⡬⠄⠶⡆⠀⠀⠀⠀⠀⣬⣿⠯⡆⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣈⢖⡍⡒
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⢾⢈⠊⠙⠙⠿⣯⣿⣽⣽⢽⢲⣀⡤⠀⢀⠂⠀⣤⣴⣾⢟⠯⣭⣳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣾⣿⣹⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢯⡹⠀⠀⠀⠀⠀⠀⠀⠈⠙⠞⢿⡻⣽⣶⣷⣧⡶⡯⠛⠟⠏⠈⠁⠈⠑⠛⠃⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣮⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢮⣬⣽⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠛⡋⢡⢀⢄⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⣿⣿⣿⣯
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣼⣩⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠁⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣴⣤⢴⣹⣿⣿⣿
                 the deadline is right now isn't it
      ]],
      -- [[
      --
      -- ]],
      -- [[
      --
      -- ]],
      -- [[
      --
      -- ]],
      -- [[
      --
      -- ]],

    }


    math.randomseed(os.time())
    local logo = logos[math.random(#logos)]

    local userName = 'Lazy'
    local greeting = getGreeting(userName)
    local marginBottom = 0
    dashboard.section.header.val = vim.split(logo, '\n')

    -- Split logo into lines
    local logoLines = {}
    for line in logo:gmatch '[^\r\n]+' do
      table.insert(logoLines, line)
    end

    -- Calculate padding for centering the greeting
    local logoWidth = logo:find '\n' - 1 -- Assuming the logo width is the width of the first line
    local greetingWidth = #greeting
    local padding = math.floor((logoWidth - greetingWidth) / 2)

    -- Generate spaces for padding
    local paddedGreeting = string.rep(' ', padding) .. greeting

    -- Add margin lines below the padded greeting
    local margin = string.rep('\n', marginBottom)

    -- Concatenate logo, padded greeting, and margin
    local adjustedLogo = logo .. '\n' .. paddedGreeting .. margin

    dashboard.section.buttons.val = {
      dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('p', '  Find file', "<cmd>lua require('fzf-lua').files({})<CR>"),
      dashboard.button('f', '  Find text',
        "<cmd>lua require('fzf-lua').live_grep({ rg_opts = '--line-number --column --with-filename --no-heading --color=never --smart-case --max-columns=4096 -e'})<CR>"),
      dashboard.button('r', '󰄉  Recent files', "<cmd>lua require('fzf-lua').oldfiles()<CR>"),
      dashboard.button('g', '  Neogit', ':Neogit<CR>'),
      dashboard.button('|', ' ', ':<CR>'),
      dashboard.button('u', '󱐥  Update plugins', '<cmd>Lazy update<CR>'),
      dashboard.button('?', '  Settings', ':e $HOME/.config/nvim/init.lua<CR>'),
      dashboard.button('.', '󱗼  Dotfiles', ':e $HOME/.config <CR>'),
      dashboard.button('q', '󰿅  Quit', '<cmd>qa<CR>'),
    }

    -- local function footer()
    -- 	return "Footer Text"
    -- end

    -- dashboard.section.footer.val = vim.split('\n\n' .. getGreeting 'Lazy', '\n')

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      desc = 'Add Alpha dashboard footer',
      once = true,
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = { ' ', ' ', ' ', ' Loaded ' .. stats.count .. ' plugins  in ' .. ms .. ' ms ' }
        dashboard.section.header.opts.hl = 'DashboardFooter'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
