var delay = 2000;function del() { document.querySelector(".app_canvas_frame").contentDocument.querySelector('a[title=删除该日志]').click(); setTimeout("yes()", delay); }function yes() { document.querySelector("#delBlogFrame").contentDocument.querySelector('.bt_tip_hit').click(); setTimeout("del()", delay); } del(); 
