/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 10;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const unsigned int gappx     = 10;
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "0xProto Nerd Font Propo:size=11" };
static const char dmenufont[]       = "0xProto Nerd Font Propo:size=11";

/* Catppuccin Mocha Mauve color scheme */
static const char col_base[]        = "#1e1e2e";  /* Base */
static const char col_mantle[]      = "#181825";  /* Mantle */
static const char col_crust[]       = "#11111b";  /* Crust */
static const char col_text[]        = "#cdd6f4";  /* Text */
static const char col_subtext0[]    = "#a6adc8";  /* Subtext0 */
static const char col_subtext1[]    = "#bac2de";  /* Subtext1 */
static const char col_overlay0[]    = "#6c7086";  /* Overlay0 */
static const char col_overlay1[]    = "#7f849c";  /* Overlay1 */
static const char col_overlay2[]    = "#9399b2";  /* Overlay2 */
static const char col_blue[]        = "#89b4fa";  /* Blue */
static const char col_lavender[]    = "#b4befe";  /* Lavender */
static const char col_sapphire[]    = "#74c7ec";  /* Sapphire */
static const char col_sky[]         = "#89dceb";  /* Sky */
static const char col_teal[]        = "#94e2d5";  /* Teal */
static const char col_green[]       = "#a6e3a1";  /* Green */
static const char col_yellow[]      = "#f9e2af";  /* Yellow */
static const char col_peach[]       = "#fab387";  /* Peach */
static const char col_maroon[]      = "#eba0ac";  /* Maroon */
static const char col_red[]         = "#f38ba8";  /* Red */
static const char col_mauve[]       = "#cba6f7";  /* Mauve */
static const char col_pink[]        = "#f5c2e7";  /* Pink */
static const char col_flamingo[]    = "#f2cdcd";  /* Flamingo */
static const char col_rosewater[]   = "#f5e0dc";  /* Rosewater */

static const char *colors[][3]      = {
	/*               fg           bg         border   */
	[SchemeNorm] = { col_subtext0, col_base,  col_overlay0 },
	[SchemeSel]  = { col_base,     col_mauve, col_mauve  },
};

/* tagging */
static const char *tags[] = { "", "󰈹", "", "", "", "", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "discord",  NULL,	      NULL,		  1 << 5,		   0,	        -1 },
	{ "steam",	  NULL,	      NULL,		  1 << 4,		   0,	        -1 },
    { "qBittorrent", NULL,    NULL,       1 << 3,          0,           -1 },
    { "Lutris",   NULL,       NULL,       1 << 4,          0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int refreshrate = 120;  /* refresh rate (per second) for client move/resize */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *runprogram[] = { "/home/knight/.local/bin/runprogram", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *brightnessup[] = { "xbacklight", "-inc", "5", NULL };
static const char *brightnessdown[] = { "xbacklight", "-dec", "5", NULL };
static const char *volumeup[] = { "pamixer", "-i", "5", NULL };
static const char *volumedown[] = { "pamixer", "-d", "5", NULL };
static const char *screenshotclipcmd[] = {"scrot", "-s", "-e", "xclip -selection clipboard -t image/png -i $f", NULL};
static const char *screenshotcmd[] = { "sh", "-c", "scrot \"$HOME/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png\"", NULL };
static const char *launchfirefox[] = { "firefox", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = runprogram } },
	{ MODKEY,	                    XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_b,      spawn,          {.v = launchfirefox } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_z, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
    {0,                             XF86XK_MonBrightnessUp, spawn, {.v = brightnessup} },
    {0,                             XF86XK_MonBrightnessDown, spawn, {.v = brightnessdown} },
    {0,                             XF86XK_AudioRaiseVolume, spawn, {.v = volumeup} },
    {0,                             XF86XK_AudioLowerVolume, spawn, {.v = volumedown} },
    { ControlMask,                  XK_Print,  spawn,          {.v = screenshotclipcmd } },
    { ControlMask|ShiftMask,        XK_Print,  spawn,          {.v = screenshotcmd } }
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
