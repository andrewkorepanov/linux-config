Config {
    -- appearance
    --font = "xft:Lato:bold:size=11:antialias=true"
    --font = "xft:Source Sans Pro:bold:size=11:antialias=true"
    --font = "xft:Roboto:bold:size=11:antialias=true"
    --font = "xft:Inter:bold:size=11:antialias=true"
    --font = "xft:Sen:bold:size=11:antialias=true"
    --font = "xft:inconsolata:size=12:antialias=true"
    font = "xft:Liberation Mono:size=11:antialias=true"
   , additionalFonts = []
    , alpha = 255
    , bgColor = "#0c0c0d"
    , fgColor = "#737373" --"#657b83"
    , position = TopSize C 100 20
    , textOffset = 16
    , iconOffset = 10

    -- general behavior
    , lowerOnStart =     True    -- send to bottom of window stack on start
    , hideOnStart =      False   -- start with window unmapped (hidden)
    , allDesktops =      True    -- show on all desktops
    , overrideRedirect = True   -- set the Override Redirect flag (Xlib)
    , pickBroadest =     False   -- choose widest display (multi-monitor)
    , persistent =       True    -- enable/disable hiding (True = disabled)
    , iconRoot = "/home/me/.xmonad/icons/"

    -- layout
    , sepChar =  "%"   -- delineator between plugin names and straight text
    , alignSep = "}{"  -- separator between left-right alignment
    , template = " %StdinReader% } %date% { %cpu% %coretemp% %memory% %wlp82s0wi% %default:Master% %bright% %battery% %kbd% "

    -- plugins
    --   Numbers can be automatically colored according to their value. xmobar
    --   decides color based on a three-tier/two-cutoff system, controlled by
    --   command options:
    --     --Low sets the low cutoff
    --     --High sets the high cutoff
    --
    --     --low sets the color below --Low cutoff
    --     --normal sets the color between --Low and --High cutoffs
    --     --High sets the color above --High cutoff
    --
    --   The --template option controls how the plugin is displayed. Text
    --   color can be set by enclosing in <fc></fc> tags. For more details
    --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
    , commands = [

        -- network activity monitor (dynamic interface resolution)
        Run DynNetwork [
            "--template"    , "<rxipat><rx><txipat><tx> kB"
            , "--Low"       , "1000"       -- units: B/s
            , "--High"      , "5000"       -- units: B/s
            , "--low"       , "#006504"
            , "--normal"    , "#006504"
            , "--high"      , "#058b00"
            , "--"
            , "--rx-icon-pattern"   , "<icon=arrow_down2.xbm/>"
            , "--tx-icon-pattern"   , "<icon=arrow_up2.xbm/>"
        ] 10

        -- wireless network
        , Run Wireless "wlp82s0" [
            "--template"    , "<icon=wifi.xbm/> <quality>% (<essid>)"
            , "-x"          , "Not Connected"
            , "--Low"       , "30"
            , "--High"      , "80"
            , "--low"       , "#d70022"
            , "--normal"    , "#058b00"
            , "--high"      , "#006504"
        ] 10

        , Run Cpu [
            "--template"    , "<icon=cpu.xbm/> <total>%"
            , "--High"      , "85"
            , "--Low"       , "10"
            , "--high"      , "#12bc00"
            , "--low"       , "#006504"
            , "--normal"    , "#058b00"
        ] 10

        -- cpu core temperature monitor
        , Run CoreTemp [
            "--template"    , "<icon=temp.xbm/> <core0>°C"
            , "--Low"       , "50"        -- units: °C
            , "--High"      , "70"        -- units: °C
            , "--low"       , "#006504"
            , "--normal"    , "#058b00"
            , "--high"      , "#12bc00"
        ] 50

        -- memory usage monitor
        , Run Memory [
            "--template"    ,"<icon=memory.xbm/> <usedratio>%"
            , "--Low"       , "20"        -- units: %
            , "--High"      , "90"        -- units: %
            , "--low"       , "#006504"
            , "--normal"    , "#058b00"
            , "--high"      , "#12bc00"
        ] 10

        -- battery monitor
        , Run Battery [
            "--template"    , "<acstatus> <left>% (<timeleft>)"
            , "--Low"       , "10"        -- units: %
            , "--High"      , "80"        -- units: %
            , "--low"       , "#d70022"
            , "--normal"    , "#058b00"
            , "--high"      , "#006504"
            , "--"
            , "-O"          , "<icon=ac1.xbm/>"
            , "-i"          , "<icon=ac2.xbm/>"
            , "-o"          , "<icon=battery_vert3.xbm/>"
        ] 50

        -- alsa volume
        , Run Volume "default" "Master" [
            "--template"    , "<status> <volume>%"
            , "--"
            , "-o"          , "<icon=volume_off.xbm/>"
            , "-O"          , "<icon=volume_on.xbm/>"
            , "-c"          , "#d70022"
            , "-C"          , "#058b00"
        ] 10

        -- brightness
        , Run Brightness [
            "--template"    , "<icon=brightness.xbm/> <percent>%"
            , "--Low"       , "10"        -- units: %
            , "--High"      , "25"        -- units: %
            , "--low"       , "#006504"
            , "--normal"    , "#058b00"
            , "--high"      , "#12bc00"
            , "--"
            , "-D"          , "/sys/class/backlight/intel_backlight/"
            , "-C"          , "brightness"
        ] 30

        -- time and date indicator
        --   (%F = y-m-d date, %a = day of week, %T = h:m:s time)
        , Run Date "<fc=#d7d7db>%F (%a) %T</fc>" "date" 10

        -- keyboard layout indicator
        , Run Kbd [
            ("us"       , "<fc=#12bc00>En</fc>")
            , ("ru"     , "<fc=#d70022>Ru</fc>")
        ]

        -- run StdinReader, see: https://github.com/xmonad/xmonad/issues/55
        , Run StdinReader
    ]
}
