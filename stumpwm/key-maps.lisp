;;----------------------------------------------------------------------------
;; *data-dir*/../key-maps.lisp
;;----------------------------------------------------------------------------

;; export custom maps.
(export '(*echo-map* *frequent-map* *xsel-map* *xclip-map* *win-frame-map*
          *toggles-map* *mplayer-map1* *mplayer-map2*))

;; set a few undefined keysyms, unavailable in */stumpwm/keysyms.lisp
(define-keysym #x1008ff02 "XF86MonBrightnessUp")
(define-keysym #x1008ff03 "XF86MonBrightnessDown")

;; set "Super+Shift+\" as prefix for root-map bindings (this will not be used)
(set-prefix-key (kbd "s-|"))

;; toggle options not often used.
(defvar *toggles-map*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "s") "mode-line")
    (dk m (kbd "ESC") "abort")
   M)))

;; some useful window/frame commands.
(defvar *win-frame-map*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "r")   "remember")
    (dk m (kbd "f")   "forget")
    (dk m (kbd "p")   "place-existing-windows")
    (dk m (kbd "n")   "repack-window-numbers")
    (dk m (kbd "ESC") "abort")
   M)))

;; transfer contents of clipboard into other buffers, or manually type cmd.
(defvar *xclip-map*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "b") "exec xclip -selection clipboard -o | xclip -selection buffer-cut -i")
    (dk m (kbd "p") "exec xclip -selection clipboard -o | xclip -selection primary -i")
    (dk m (kbd "s") "exec xclip -selection clipboard -o | xclip -selection secondary -i")
    (dk m (kbd ";") "prompt-xclip")
    (dk m (kbd ":") "echo-xclip")
    (dk m (kbd "ESC") "abort")
   M)))

;; interact with the xselection and meta commands.
(defvar *xsel-map*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "c")   "copy-last-message")
    (dk m (kbd "g")   "getsel")
    (dk m (kbd "m")   "meta")
    (dk m (kbd "p")   "putsel")
    (dk m (kbd "s")   "window-send-string")
    (dk m (kbd "ESC") "abort")
  M)))

;; frequently used echoes for quick information grabbing.
(defvar *echo-map*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "b")   "echo-battery")
    (dk m (kbd "c")   "echo-colors-brief")
    (dk m (kbd "d")   "echo-date")
    (dk m (kbd "f")   "echo-free-mem")
    (dk m (kbd "h")   "echo-free-hdd")
    (dk m (kbd "l")   "echo-loadavg")
    (dk m (kbd "m")   "echo-mifo-stumpwm")
    (dk m (kbd "M")   "echo-mifo-raw")
    (dk m (kbd "C-m") "echo-mifo-current-list")
    (dk m (kbd "p")   "echo-highcpu-user")
    (dk m (kbd "P")   "echo-highcpu-root")
    (dk m (kbd "C-p") "echo-highcpu-rest")
    (dk m (kbd "u")   "echo-mail")
    (dk m (kbd "v")   "echo-oss-vol")
    (dk m (kbd "w")   "pout exec sdcv -nu WordNet ")
    (dk m (kbd "ESC") "abort")
   M)))

;; frequently used commands.
(defvar *frequent-map*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "2") "echo-oss-speakers")
    (dk m (kbd "3") "echo-oss-headphones")
    (dk m (kbd "b") "display-random-bg")
    (dk m (kbd "B") "exec display -window root -resize 1600x900! /howl/foto/wall/wallpaper-31278.png")
    (dk m (kbd "C-b") "exec display -window root -resize 1600x900! /howl/foto/wall/1366x768_dizorb_landscape_study_hd_wallpaper.png")
;;    (dk m (kbd "f") "ror_firefox")
    (dk m (kbd "h") "exec urxvt -e htop")
;;    (dk m (kbd "j") "ror_jumanji")
    (dk m (kbd "l") "ror_luakit")
    (dk m (kbd "m") "ror_mutt")
    (dk m (kbd "s") "exec urxvt -e nsudoku 12")
    (dk m (kbd "x") "exec xskat -opt ${XDG_CONFIG_DIR:-${HOME}}/xorg/xskat.opt -list ${XDG_CONFIG_DIR:-${HOME}}/xorg/xskat.lst")
    (dk m (kbd "ESC") "abort")
   M)))

;; mplayer daemon (mifo) frequently used commands.
(defvar *mplayer-map1*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "a")     "prompt-mifo-load")
    (dk m (kbd "A")     "prompt-mifo-append")
    (dk m (kbd "d")     "exec sudo /etc/rc.d/mifo start")
    ;(dk m (kbd "d")     "exec mifo --daemon")
    (dk m (kbd "f")     "exec mifo --fullscreen")
    (dk m (kbd "h")     "echo-mifo-prev")
    (dk m (kbd "H")     "prompt-mifo-prev")
    (dk m (kbd "j")     "exec mifo --next +")
    (dk m (kbd "k")     "exec mifo --prev dir")
    (dk m (kbd "l")     "echo-mifo-next")
    (dk m (kbd "L")     "prompt-mifo-next")
    (dk m (kbd "p")     "prompt-mifo-playlist")
    (dk m (kbd "P")     "echo-mifo-playlists")
    (dk m (kbd "q")     "exec sudo /etc/rc.d/mifo stop")
    ;(dk m (kbd "q")     "exec mifo --quit")
    (dk m (kbd "Q")     "exec sudo /etc/rc.d/mifo kill")
    (dk m (kbd "r")     "echo-mifo-random")
    (dk m (kbd "s")     "prompt-mifo-save")
    (dk m (kbd "S")     "exec mifo --stop")
    (dk m (kbd "t")     "exec mifo --toggle")
    (dk m (kbd "+")     "echo-mifo-fav-add")
    (dk m (kbd "-")     "echo-mifo-fav-del")
    (dk m (kbd "Return")"prompt-mifo-reload")
    (dk m (kbd "ESC")   "abort")
   M)))

;; mplayer daemon (mifo) useful seek commands.
(defvar *mplayer-map2*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    (dk m (kbd "h")     "exec mifo -c seek -7")
    (dk m (kbd "H")     "exec mifo -c seek -17")
    (dk m (kbd "C-h")   "exec mifo -c seek -47")
    (dk m (kbd "M-h")   "exec mifo -c seek -407")
    (dk m (kbd "l")     "exec mifo -c seek 5")
    (dk m (kbd "L")     "exec mifo -c seek 15")
    (dk m (kbd "C-l")   "exec mifo -c seek 45")
    (dk m (kbd "M-l")   "exec mifo -c seek 405")
    (dk m (kbd "!")     "exec mifo -c seek_chapter -1")
    (dk m (kbd "@")     "exec mifo -c seek_chapter 1")
    (dk m (kbd "BackSpace") "exec mifo -c seek 0 1")
    (dk m (kbd "ESC")   "abort")
   M)))

(setf *top-map*
  (let ((m (make-sparse-keymap)))
    (labels ((dk (m k c) (define-key m k c)))
    ;; <numerical bindings>
    (dk m (kbd "s-1")    "gselect 1")
    (dk m (kbd "s-2")    "gselect 2")
    (dk m (kbd "s-3")    "gselect 3")
    (dk m (kbd "s-4")    "gselect 4")
    (dk m (kbd "s-5")    "gselect 5")
    (dk m (kbd "s-6")    "gselect 6")
    (dk m (kbd "s-8")    "mark")
    (dk m (kbd "s-C-8")  "clear-window-marks")
    (dk m (kbd "s-M-8")  "gmove-marked")
    (dk m (kbd "s-9")    "quiet-resize -10 0")
    (dk m (kbd "s-0")    "quiet-resize  10 0")
    (dk m (kbd "C-1")    "select-window-by-number 1")
    (dk m (kbd "C-2")    "select-window-by-number 2")
    (dk m (kbd "C-3")    "select-window-by-number 3")
    (dk m (kbd "C-4")    "select-window-by-number 4")
    (dk m (kbd "C-5")    "select-window-by-number 5")
    (dk m (kbd "C-6")    "select-window-by-number 6")
    (dk m (kbd "C-7")    "select-window-by-number 7")
    (dk m (kbd "C-8")    "select-window-by-number 8")
    (dk m (kbd "C-9")    "select-window-by-number 9")
    (dk m (kbd "C-0")    "select-window-by-number 0")
    ;; <special-char bindings>
    (dk m (kbd "s-!")    "gmove 1")
    (dk m (kbd "s-@")    "gmove 2")
    (dk m (kbd "s-#")    "gmove 3")
    (dk m (kbd "s-$")    "gmove 4")
    (dk m (kbd "s-%")    "gmove 5")
    (dk m (kbd "s-^")    "gmove 6")
    (dk m (kbd "s-*")    "pull-marked")
    (dk m (kbd "s-(")    "quiet-resize 0 -10")
    (dk m (kbd "s-)")    "quiet-resize 0  10")
    (dk m (kbd "s--")    "vsplit")
    (dk m (kbd "s-=")    "hsplit")
    (dk m (kbd "s-+")    "balance-frames")
    (dk m (kbd "s-;")    "colon")
    (dk m (kbd "s-:")    "manpage")
    (dk m (kbd "s-C-;")  "eval")
    (dk m (kbd "s-,")    "gprev")
    (dk m (kbd "s-<")    "gmove-prev")
    (dk m (kbd "s-C-,")  "gprev-with-window")
    (dk m (kbd "s-.")    "gnext")
    (dk m (kbd "s->")    "gmove-next")
    (dk m (kbd "s-C-.")  "gnext-with-window")
    (dk m (kbd "s-/")    "gother")
    (dk m (kbd "s-?")    "lastmsg")
    (dk m (kbd "s-ESC")  "exec banishmouse")
    (dk m (kbd "s-Tab")  "fother")
    (dk m (kbd "s-BackSpace")       "fclear")
    (dk m (kbd "s-S-BackSpace")     "delete-window")
    (dk m (kbd "s-C-BackSpace")     "kill-window")
    (dk m (kbd "s-Return")          "exec urxvt -e tmux -S /tmp/.${UID}/tmux/xorg new-session")
    (dk m (kbd "s-S-Return")        "tmux-attach-else-new")
    (dk m (kbd "s-C-Return")        "exec urxvt")
    (dk m (kbd "s-SunPrint_Screen") "exec import -window root ${XDG_PICTURES_DIR:-${H:-/howl}/foto}/shot/$(date +%Y_%m_%d-%H%M%S).png")
    (dk m (kbd "C-M-Delete")        "exec alock -bg image:file=${XDG_PICTURES_DIR:-${H:-/howl}/foto}/wall/beheading.png -cursor glyph -auth pam >&/dev/null")
    (dk m (kbd "C-s-Delete")        "exec alock -bg image:file=${XDG_PICTURES_DIR:-${H:-/howl}/foto}/wall/beheading.png -cursor glyph -auth pam >&/dev/null")
    ;; <alphabetic bindings>
    (dk m (kbd "s-a")    *echo-map*)
    (dk m (kbd "s-b")    "refresh")
    (dk m (kbd "s-B")    "redisplay")
    (dk m (kbd "s-c")    *xclip-map*)
    (dk m (kbd "s-d")    *mplayer-map1*)
    (dk m (kbd "s-D")    "prompt-mifo-command")
    (dk m (kbd "s-e")    "exec ")
    (dk m (kbd "s-E")    "shell-command-output")
    (dk m (kbd "s-f")    *frequent-map*)
    (dk m (kbd "s-F")    *win-frame-map*)
    (dk m (kbd "s-g")    "vgroups")
    (dk m (kbd "s-G")    "grouplist")
    (dk m (kbd "s-h")    "move-focus left")
    (dk m (kbd "s-H")    "move-window left")
    (dk m (kbd "s-C-h")  "exchange-direction left")
    (dk m (kbd "s-M-h")  "exchange-direction-remain left")
    (dk m (kbd "s-i")    "fselect")
    (dk m (kbd "s-j")    "move-focus down")
    (dk m (kbd "s-J")    "move-window down")
    (dk m (kbd "s-C-j")  "exchange-direction down")
    (dk m (kbd "s-M-j")  "exchange-direction-remain down")
    (dk m (kbd "s-k")    "move-focus up")
    (dk m (kbd "s-K")    "move-window up")
    (dk m (kbd "s-C-k")  "exchange-direction up")
    (dk m (kbd "s-M-k")  "exchange-direction-remain up")
    (dk m (kbd "s-l")    "move-focus right")
    (dk m (kbd "s-L")    "move-window right")
    (dk m (kbd "s-C-l")  "exchange-direction right")
    (dk m (kbd "s-M-l")  "exchange-direction-remain right")
    (dk m (kbd "s-m")    "master-focus")
    (dk m (kbd "s-M")    "master-swap 0")
    (dk m (kbd "s-C-m")  "master-make")
    (dk m (kbd "s-n")    "next-in-frame")
    (dk m (kbd "s-N")    "pull-hidden-next")
    (dk m (kbd "s-o")    "fullscreen") 
    (dk m (kbd "s-O")    "only") 
    (dk m (kbd "s-p")    "prev-in-frame")
    (dk m (kbd "s-P")    "pull-hidden-previous")
    (dk m (kbd "s-Q")    "quit")
    (dk m (kbd "s-r")    "loadrc")
    (dk m (kbd "s-R")    "restart")
    (dk m (kbd "s-s")    *mplayer-map2*)
    (dk m (kbd "s-t")    *toggles-map*)
    (dk m (kbd "s-T")    "title")
    (dk m (kbd "s-u")    "undo")
    (dk m (kbd "s-v")    "show-window-properties")
    (dk m (kbd "s-V")    "list-window-properties")
    (dk m (kbd "s-w")    "echo-frame-windows")
    (dk m (kbd "s-W")    "windowlist")
    (dk m (kbd "s-x")    *xsel-map*)
    (dk m (kbd "s-y")    "iresize")
    (dk m (kbd "s-z")    "remove-split")
    ;; <function-key bindings>
    (dk m (kbd "XF86AudioMute")         "echo-oss-volmute")
    (dk m (kbd "XF86AudioRaiseVolume")  "echo-oss-volup")
    (dk m (kbd "XF86AudioLowerVolume")  "echo-oss-voldown")
    (dk m (kbd "XF86MonBrightnessUp")   "exec moodlight --increase")
    (dk m (kbd "C-XF86MonBrightnessUp") "exec moodlight --max")
    (dk m (kbd "XF86MonBrightnessDown") "exec moodlight --decrease")
    (dk m (kbd "s-C-F9")  "dump-to-datadir rules")
    (dk m (kbd "s-C-F10") "dump-to-datadir desktop")
    (dk m (kbd "s-C-F11") "dump-to-datadir screen")
    (dk m (kbd "s-C-F12") "dump-to-datadir group")
    (dk m (kbd "s-F9")    "restore-from-datadir rules")
    (dk m (kbd "s-F10")   "restore-from-datadir desktop")
    (dk m (kbd "s-F11")   "restore-from-datadir screen")
    (dk m (kbd "s-F12")   "restore-from-datadir group")
    ;(dk m (kbd "s-C-F7") "dump-window-placement-rules /howl/conf/stumpwm/storage/placement_rules")
    ;(dk m (kbd "s-F7")   "restore-window-placement-rules /howl/conf/stumpwm/storage/placement_rules")
   ; (dk m (kbd "s-quoteleft") "abort")
    (dk m (kbd "s-quoteleft") "scratchpad")
   M)))

;; EOF
