static const char norm_fg[] = "#bfbec3";
static const char norm_bg[] = "#0E0E17";
static const char norm_border[] = "#858588";

static const char sel_fg[] = "#bfbec3";
static const char sel_bg[] = "#3C4554";
static const char sel_border[] = "#bfbec3";

static const char urg_fg[] = "#bfbec3";
static const char urg_bg[] = "#4C3B45";
static const char urg_border[] = "#4C3B45";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
