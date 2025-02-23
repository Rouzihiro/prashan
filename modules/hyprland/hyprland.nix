{
  colorScheme,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.plugins = [
    pkgs.hyprlandPlugins.hypr-dynamic-cursors
  ];
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {

    # PLEASE MAKE SURE YOU GENERATE THESE FILES USING NWG-DISPLAYS
    # BEFORE SOURCING THEM, TILL THEN USE NORMAL MONITOR CONFIG
    # monitor = ", 1920x1080@144, auto, 1";
    source = [
      "~/.config/hypr/monitors.conf"
      "~/.config/hypr/workspaces.conf"
    ];

    "$terminal" = "kitty";
    "$fileManager" = "kitty ranger";
    "$menu" = "wofi --show drun";
    "$browser" = "brave";

    "env" = [
      "HYPRSHOT_DIR,/home/prashant/Pictures/Screenshots"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "XDG_SESSION_TYPE,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "HYPRCURSOR_THEME,McMojave"
      "XCURSOR_THEME,McMojave Cursors"
      "HYPRCURSOR_SIZE,35"
      "XCURSOR_SIZE,47"
      "LIBVA_DRIVER_NAME,nvidia"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];

    general = {
      gaps_in = 4;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgb(${colorScheme.palette.base04})";
      # "col.inactive_border" = "rgb(${colorScheme.palette.base01})";
      resize_on_border = true;
      hover_icon_on_border = true;
      extend_border_grab_area = true;
      no_focus_fallback = true;
      allow_tearing = false;
      layout = "dwindle";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
      rounding = 7;
      active_opacity = 0.97;
      inactive_opacity = 0.93;

      blur = {
        enabled = true;
        size = 8;
        passes = 1;
        vibrancy = 0.12;
      };
    };

    animations = {
      enabled = "yes";

      bezier = [
        "overshot,0.01, 0.9, 0.1, 1.04"
        "easeoutexpo,0.16, 1, 0.3, 1"
      ];

      animation = [
        "windows, 1, 7, overshot, popin 50%"
        "windowsOut, 1, 7, easeoutexpo, popin 50%"
        "border, 1, 10, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, overshot"
      ];
    };

    binds = {
      scroll_event_delay = 0;
    };

    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
      new_status = "master";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      "col.splash" = "0x${colorScheme.palette.base03}";
      focus_on_activate = true;

      force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
    };

    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
        natural_scroll = true;
      };
    };

    # https://wiki.hyprland.org/Configuring/Variables/#gestures
    gestures = {
      workspace_swipe = true;
    };

    # Example per-device config
    # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
    device = {
      name = "razer-razer-deathadder-essential";
      sensitivity = -0.82;
    };

    "$mainMod" = "SUPER";

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    "bind" = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, B, exec, $browser"
      "$mainMod, SPACE, exec, $menu"

      "$mainMod, Q, killactive,"
      "$mainMod, T, togglefloating,"
      "$mainMod, F, fullscreen,"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, h, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, l, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, k, movefocus, u"
      "$mainMod, down, movefocus, d"
      "$mainMod, j, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Scroll through existing workspaces with super + shift + j/k
      "$mainMod SHIFT, j, workspace, e+1"
      "$mainMod SHIFT, k, workspace, e-1"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      "$mainMod, PRINT, exec, hyprshot -m window"
      # Screenshot a monitor
      ", PRINT, exec, hyprshot -m output"
      # Screenshot a region
      "$mainMod SHIFT, PRINT, exec, hyprshot -m region"

      # clipboard
      "SUPER, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

      # logout menu
      "SUPER, ESCAPE, exec, wlogout"

    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    "bindm" = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    "bindel" = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ];

    # Requires playerctl
    "bindl" = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    # Screenshot a window
    ##############################
    ### WINDOWS AND WORKSPACES ###
    ##############################

    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
    # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

    # Example windowrule v1
    # windowrule = float, ^(kitty)$

    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

    # Ignore maximize requests from apps. You'll probably like this.
    "windowrulev2" = [
      "suppressevent maximize, class:.*"

      # Fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      # hide xwaylandvideobridge window
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
      "nofocus, class:^(xwaylandvideobridge)$"
    ];

    exec-once = [
      "uwsm app -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "uwsm app -- xwaylandvideobridge &"
      "systemctl --user enable --now hyprpolkitagent.service"
      "uwsm app -- dunst"
      "uwsm app -- waybar"
      "uwsm app -- wl-paste --watch cliphist store"
      "uwsm app -- nm-applet --indicator &"
      "uwsm app -- blueman-applet"
      "uwsm app -- udiskie &"
    ];
    # #

    "windowrule" = "float, ^.*(iwgtk)$";

    debug = {
      disable_scale_checks = true;
    };

  };

  wayland.windowManager.hyprland.extraConfig = ''
       plugin:dynamic-cursors {

        # enables the plugin
        enabled = true

        # sets the cursor behaviour, supports these values:
        # tilt    - tilt the cursor based on x-velocity
        # rotate  - rotate the cursor based on movement direction
        # stretch - stretch the cursor shape based on direction and velocity
        # none    - do not change the cursors behaviour
        mode = tilt

        # minimum angle difference in degrees after which the shape is changed
        # smaller values are smoother, but more expensive for hw cursors
        threshold = 2

        # override the mode behaviour per shape
        # this is a keyword and can be repeated many times
        # by default, there are no rules added
        # see the dedicated `shape rules` section below!
        # shaperule = <shape-name>, <mode> (optional), <property>: <value>, ...
        # shaperule = <shape-name>, <mode> (optional), <property>: <value>, ...

        # for mode = rotate
        rotate {

            # length in px of the simulated stick used to rotate the cursor
            # most realistic if this is your actual cursor size
            length = 20

            # clockwise offset applied to the angle in degrees
            # this will apply to ALL shapes
            offset = 0.0
        }

        # for mode = tilt
        tilt {

            # controls how powerful the tilt is, the lower, the more power
            # this value controls at which speed (px/s) the full tilt is reached
            limit = 3500

            # relationship between speed and tilt, supports these values:
            # linear             - a linear function is used
            # quadratic          - a quadratic function is used (most realistic to actual air drag)
            # negative_quadratic - negative version of the quadratic one, feels more aggressive
            function = negative_quadratic
        }

        # for mode = stretch
        stretch {

            # controls how much the cursor is stretched
            # this value controls at which speed (px/s) the full stretch is reached
            limit = 3000

            # relationship between speed and stretch amount, supports these values:
            # linear             - a linear function is used
            # quadratic          - a quadratic function is used
            # negative_quadratic - negative version of the quadratic one, feels more aggressive
            function = quadratic
        }

        # configure shake to find
        # magnifies the cursor if its is being shaken
        shake {

            # enables shake to find
            enabled = true

            # use nearest-neighbour (pixelated) scaling when shaking
            # may look weird when effects are enabled
            nearest = true

            # controls how soon a shake is detected
            # lower values mean sooner
            threshold = 4.0

            # magnification level immediately after shake start
            base = 4.0
            # magnification increase per second when continuing to shake
            speed = 4.0
            # how much the speed is influenced by the current shake intensitiy
            influence = 0.0

            # maximal magnification the cursor can reach
            # values below 1 disable the limit (e.g. 0)
            limit = 0.0

            # time in millseconds the cursor will stay magnified after a shake has ended
            timeout = 1200

            # show cursor behaviour `tilt`, `rotate`, etc. while shaking
            effects = true

            # enable ipc events for shake
            # see the `ipc` section below
            ipc = false
        }

        # use hyprcursor to get a higher resolution texture when the cursor is magnified
        # see the `hyprcursor` section below
        hyprcursor {

            # use nearest-neighbour (pixelated) scaling when magnifing beyond texture size
            # this will also have effect without hyprcursor support being enabled
            # 0 / false - never use pixelated scaling
            # 1 / true  - use pixelated when no highres image
            # 2         - always use pixleated scaling
            nearest = true

            # enable dedicated hyprcursor support
            enabled = true

            # resolution in pixels to load the magnified shapes at
            # be warned that loading a very high-resolution image will take a long time and might impact memory consumption
            # -1 means we use [normal cursor size] * [shake:base option]
            resolution = -1

            # shape to use when clientside cursors are being magnified
            # see the shape-name property of shape rules for possible names
            # specifying clientside will use the actual shape, but will be pixelated
            fallback = clientside
        }
    }
  '';
}
