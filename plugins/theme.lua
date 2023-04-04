return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
"................................ ....... ....,;;::;;,................................",
".........................',;. ........  ..;lddoodddddolc:,...........................",
".......................';:lc'.... ... .':oddxdoodddddolccc:,.........................",
".....................';cllodc'..':c:;;cdkkkxddxxollll:;,;;:c;'.......................",
"....................,lxkkOKXN0dxKXNNXKKXXXKKKK0kdl:;,....',;;,'......................",
".................. .oO00KXNNWNXNWWNNNNNNNXXKKXX0xc,..........','.....................",
"...............';:lkKXXXNNNNNNNNNNNNNNNNNNNNXXXX0d:...........','....................",
"............:dkKXNWWWNNNXXKXXXXNNNNNNNWWWWWWWNNNNK0x:........ .',....................",
"..........,dXNNWWWWWWNXXXKKKKKKXNNNNNWWWWWWWNNNNNXXKOc..........''...................",
".........'dXNNNWWNNXXXXXXXXKKKKXNNWWWWWWWWWNNXXXXNXXXx;.........''...................",
"........,xKK0XNXXXXKKKKKKKXKKKKXNNWWWMMMWWWWXK0OOO0XX0:..............................",
".......,ooldOK0OKKKKK0000O0KK00KXNWWWWWWWWWWWWNX0kxdkOc..............................",
".......,llxKNXkdOKXKd:,;ldkXKOKKKXNWWWWWNNWWWWWWNNXOdd;..............................",
".......'ckXNNXOxOKXKOxdodOKNXk0NK0XNWWNNNNWWWWWWNNX0kl'..............................",
".........lXNXXXXNXXNNNNNNNNNX0KNKO0XNNNXNNWWWWWWNNX0kdlc:::::;;,,'...................",
".........,kNXNNNXXNNXNNNNNNNNNKKKOOXNNNXXNNNNWNNXK0xddddoxOKXXXXK0Oxdlc:;;;,',',;;'..",
".........'oKXNNNXXNNXXNXXXXXXKK00O0XWNNNXNNNNNNXK0kdddoolxKNWWWWNNNNNWWNNXKOxdlll:'..",
"...,:oxkkk000KKOkxoollodxxkkO00KKOOXWWNNXXNNXNXX0OxdxddddONWWNNNNNNNNNXX0xoc;,,,.....",
"....,lkKKKK0Oxl;'.......,;codxO0000XWWNNXNNXXXXXKOkxdxO0KXNNXXXXNNXXKOkxdolcc:,......",
".....;ok0KXNXOdodk00K0000OOOOkkxx0KXNNXXXNXKKKXX0kxdooOKKKKKKKK00Okxxxxkkdl:,........",
".....'codxKWWK0KXXXNXXXXXK0KKK00kkkk0XXXNNXX0O0K0kxoc:oxkdlddxxxxxdddddol:'..........",
"......:loxXWNKKXKKXKKKKKKKXXKO00OdoxOXNNNNXNXOk0K0Odlc::;.....''''''''...............",
"......',:OWWNKKXXXXXKKXXNXK0kkOOdlok0XXNNXKXKkk0XX0xdo,..............................",
"........,kWWNKKNNNNNNNNNXK0OkO0kolxOKXXXXK00kxOKXK0kd:...............................",
"........'dNNNXK0XXNNXXXXK00OOOkollxOKXXXK0OkxOKXKK0x:................................",
".........;kXXNX00KKXXXXK0Okxollclox0KXKKKKOkOKXXKK0o.................................",
"..........,o0KKXKOkxxxdolc;,;:cdxk0KKKKKKKOOKXNXKKOc.................................",
"............,xKKK0Oxo:;,,,,,:ldkO00000KKKOk0XNNXK0x;.................................",
"...   .......:OKOkkxdl::;;;:cloddxkkO00Okkk0XXXKOko'.................................",
"..    ........cO0OxdoccccccclllllodddkkxdxOKK0Okxd:..................................",
"       ........,dkkdolc:::cclcccclooooolodxOkxdoxd,..................................",
"        .........;okkxoodkkkOOkkO000Okxdoddkkxxxko...................................",
"        ...........:kXNNXNNNNNNNNNNNXXKOkO0KKOkkxc...................................",
"          ........  .oNWNNNNNNWWWWWNXXXKKXNX0kkOd,...................................",
"          ......     ,0NWWNNNNNNNNNNNNNNNNNK0O00o....................................",
"           ..        .xXNNNNNNNNNNNNNNNNNNXK00K0c....................................",
"                     .dNXXNNNNNNNWWWWNNNNXKKXXKOc....................................",
"                      oNNNNNNNNNNNNWWWNNXKKKKKKOc....................................",
"                      cXNNNNNNNNNNNNNNNNXXXXK00Oc....................................",
    }
    dashboard.section.header.opts.hl = "DashboardHeader"

    local button = require("astronvim.utils").alpha_button
    dashboard.section.buttons.val = {
      button("LDR n", "  New File  "),
      button("LDR f f", "  Find File  "),
      button("LDR f o", "  Recents  "),
      button("LDR f w", "  Find Word  "),
      button("LDR f '", "  Bookmarks  "),
      button("LDR S l", "  Last Session  "),
    }

    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
    dashboard.config.layout[3].val = 5
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = require "plugins.configs.alpha",
}
