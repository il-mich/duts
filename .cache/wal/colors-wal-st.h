const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0E0E17", /* black   */
  [1] = "#4C3B45", /* red     */
  [2] = "#3C4554", /* green   */
  [3] = "#5B555F", /* yellow  */
  [4] = "#AC494A", /* blue    */
  [5] = "#787886", /* magenta */
  [6] = "#8F8086", /* cyan    */
  [7] = "#bfbec3", /* white   */

  /* 8 bright colors */
  [8]  = "#858588",  /* black   */
  [9]  = "#4C3B45",  /* red     */
  [10] = "#3C4554", /* green   */
  [11] = "#5B555F", /* yellow  */
  [12] = "#AC494A", /* blue    */
  [13] = "#787886", /* magenta */
  [14] = "#8F8086", /* cyan    */
  [15] = "#bfbec3", /* white   */

  /* special colors */
  [256] = "#0E0E17", /* background */
  [257] = "#bfbec3", /* foreground */
  [258] = "#bfbec3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
