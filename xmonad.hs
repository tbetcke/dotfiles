import XMonad
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig 
import XMonad.Prompt.ConfirmPrompt
import XMonad.Prompt.Shell
import System.Exit
import XMonad.Util.Run
import Control.Monad
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

import qualified Data.Map as M
import qualified XMonad.StackSet as W


baseConfig = desktopConfig

myTerminal = "alacritty"
myModMask = mod4Mask
myBorderWidth = 3

exitPrompt = do
    response <- runProcessWithInput "rofi" ["-dmenu", "-p", "Really quit?"] "no\nyes\n"
    when (response == "yes\n") (io (exitWith ExitSuccess))
    

mediaKeys = [ ((0, xF86XK_MonBrightnessUp), spawn "light -A 10")
            , ((0, xF86XK_MonBrightnessDown), spawn "light -U 10")
            , ((0, xF86XK_AudioLowerVolume   ), spawn "~/.local/bin/change_volume.sh -2%")
            , ((0, xF86XK_AudioRaiseVolume   ), spawn "~/.local/bin/change_volume.sh +2%")
            , ((0, xF86XK_AudioMute          ), spawn "~/.local/bin/toggle_mute.sh")
        ]

myKeys = [
    
            ("M-p", spawn "~/.local/bin/monitor_layout.sh")
            , ("M-<Return>", spawn myTerminal)
            , ("M-S-p", spawn "rofi -show drun")
            , ("M-S-q", exitPrompt)
            , ("M-c", spawn "google-chrome")
            , ("M-S-<Space>", sendMessage ToggleStruts)

        ]

-- Gaps around and between windows
-- Changes only seem to apply if I log out then in again
-- Dimensions are given as (Border top bottom right left)
mySpacing = spacingRaw True             -- Only for >1 window
                       -- The bottom edge seems to look narrower than it is
                       (Border 10 10 10 10) -- Size of screen edge gaps
                       True             -- Enable screen edge gaps
                       (Border 10 10 10 10) -- Size of window gaps
                       True             -- Enable window gaps



main = do
    xmonad $ ewmh $ desktopConfig {
        terminal = myTerminal
        , modMask = myModMask
        , borderWidth = myBorderWidth
        , focusedBorderColor = "#ff2037"
        , layoutHook = avoidStruts $ mySpacing $ smartBorders (layoutHook desktopConfig)
        , startupHook = startupHook baseConfig 
            <+> spawnOnce "xmobar ~/.xmonad/xmobarrc"
            <+> spawnOnce "stalonetray"
            <+> spawnOnce "dunst"
            <+> spawnOnce "alacritty"
            <+> spawnOnce "dropbox start"
            <+> spawnOnce "pasystray"
            <+> spawnOnce "nm-applet"
            <+> spawnOnce "light -S 20"
            <+> spawnOnce "xss-lock --transfer-sleep-lock -- i3lock -n"
            <+> spawnOnce "blueman-applet"
            <+> spawnOnce "udiskie -at"
            <+> spawnOnce "picom --experimental-backends"


    } `additionalKeys` mediaKeys
      `additionalKeysP` myKeys



