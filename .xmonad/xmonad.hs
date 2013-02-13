import Data.Ratio ((%))
import XMonad
import XMonad.Actions.PhysicalScreens
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Layout
import XMonad.Layout.Accordion
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import XMonad.Util.CustomKeys
-- import XMonad.Util.EZConfig
import XMonad.Util.Run
import qualified Data.Map as M
import qualified XMonad.StackSet as W

main = xmonad defaultConfig
  { keys = customKeys delkeys inskeys
  , manageHook = myManageHook <+> manageHook defaultConfig
  , XMonad.layoutHook = myLayout
  , borderWidth = 0
  , focusedBorderColor = "#fff"
  , handleEventHook = fullscreenEventHook
  , modMask = mod4Mask
  , normalBorderColor = "#333"
  , terminal = "urxvt -b 0 -sl 65535"
  }
    where
      delkeys :: XConfig l -> [(KeyMask, KeySym)]
      delkeys XConfig {modMask = modm} =
        [ (modm .|. m, k) | (m, k) <- zip [0, shiftMask] [xK_w, xK_e, xK_r] ]

      inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
      inskeys conf@(XConfig {modMask = modm}) =
        [ ((modm .|. shiftMask, xK_Return) , spawn $ XMonad.terminal conf)
        , ((modm , xK_e), viewScreen 1)
        , ((modm , xK_r), viewScreen 2)
        , ((modm , xK_w), viewScreen 0)
        , ((modm .|. shiftMask, xK_c), kill)
        , ((modm .|. shiftMask, xK_e), sendToScreen 1)
        , ((modm .|. shiftMask, xK_r), sendToScreen 2)
        , ((modm .|. shiftMask, xK_w), sendToScreen 0)
        , ((modm .|. shiftMask, xK_x), spawn "slock")
        , ((modm, xK_F3 ), shellPrompt  defaultXPConfig)
        , ((modm, xK_a), onPrevNeighbour W.view)
        , ((modm, xK_o), onNextNeighbour W.view)
        ]
      myManageHook = composeAll
        [ className =? "Pidgin" --> doShift "4:Pidgin"
        , manageDocks
        , isFullscreen --> doFullFloat
        ]
      myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      myLayout = avoidStruts (onWorkspace "4:Pidgin" pidginLayout $ noBorders tiled ||| noBorders (Mirror tiled) ||| noBorders Full)
        where
          tiled   = Tall nmaster delta ratio -- default tiling algorithm partitions the screen into two panes
          nmaster = 1 -- The default number of windows in the master pane
          ratio   = 1/2 -- Default proportion of screen occupied by master pane
          delta   = 3/100 -- Percent of screen to increment by when resizing panes
          gridLayout = spacing 8 $ Grid
          pidginLayout = withIM (18/100) (Role "buddy_list") gridLayout



-- main = do
--	-- spawn "pidgin"
--	-- h <- spawnPipe "xmobar ~/.xmobarrc"
--   xmonad $ defaultConfig
--		{ manageHook = myManageHook <+> manageHook defaultConfig
--		, XMonad.layoutHook = myLayout
--		, borderWidth = 0
--		, focusedBorderColor = "#fff"
--		, handleEventHook = fullscreenEventHook
--		, modMask = mod4Mask
--		, normalBorderColor = "#333"
--     , keys = customKeys inskeys
--		, terminal = "urxvt -b 0 -sl 65535"
--		-- , handleEventHook = docksEventHook
--     -- , logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }
--     }
--     where
--       inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
--       inskeys conf@(XConfig {modMask = modMask}) =
--         [ ((modMask .|. shiftMask, xK_Return) , spawn $ XMonad.terminal conf)
--         , ((modMask, xK_F3 ), shellPrompt  defaultXPConfig)
--         , ((modMask, xK_a), onPrevNeighbour W.view)
--         , ((modMask, xK_o), onNextNeighbour W.view)
--         , ((modMask .|. shiftMask, xK_c), kill)
--         , ((modMask .|. shiftMask, xK_x), spawn "slock")
--         , ((modMask .|. shiftMask, xK_w), spawn "slock")
--         , ((modMask .|. shiftMask, xK_e), spawn "slock")
--         , ((modMask , xK_e), viewScreen 1)
--         , ((modMask , xK_r), viewScreen 2)
--         , ((modMask , xK_w), viewScreen 0)
--         , ((modMask .|. shiftMask, xK_e), sendToScreen 1)
--         , ((modMask .|. shiftMask, xK_r), sendToScreen 2)
--         , ((modMask .|. shiftMask, xK_w), sendToScreen 0)
--         ]

-- myManageHook = composeAll
--   [ className =? "Pidgin" --> doShift "4:Pidgin"
--   , manageDocks
--   , isFullscreen --> doFullFloat
--   ]

  -- ++
  -- [((modMask .|. mask, key), action screen)
  -- | (key, screen) <- zip [xK_w, xK_e, xK_r] [0..]
  -- , (action, mask) <- [(viewScreen, 0), (sendToScreen, shiftMask)]
  -- ]
-- myKeys =
  -- [ ("M-S-x", spawn "slock")
  -- , ("<Print>"    , spawn "scrot"                      ) -- screenshot
  -- , ("M-S-s", spawn "scrot")
  -- ]
  -- ++
  -- [ (mask ++ "M-" ++ [key], screenWorkspace screen >>= flip whenJust (windows . action))
  -- | (key, screen)  <- zip "wer" [2, 0, 1]
  -- , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
  -- ]

