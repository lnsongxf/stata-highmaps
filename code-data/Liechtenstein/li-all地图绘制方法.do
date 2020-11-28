* li-all 地图绘制方法：
* 欢迎关注微信公众号 RStata 获取更多 Stata 相关的学习资料和资源！
* 作者：微信 r_stata
* 注意：运行代码前请记得把工作目录设置为 li-all_db.dta 文件所在的文件夹。
use "li-all_db", clear 
gen value = int(runiform(1, 84))
spmap value using li-all_coord, id(ID) ///
      fcolor("252 255 164" "252 181 25" "237 105 37" "187 55 84" ///
              "120 28 109" "51 10 95") ///
      ocolor("black" ...) ///
      clmethod(custom) clbreaks(0 14 28 42 56 70 84) /// 
      graphr(margin(medlarge)) ///
      caption("绘制：微信公众号 RStata", size(*0.8)) ///
      osize(vvthin ...) ///
      legend(size(*1.3) ///
              order(2 "0～14" 3 "14～28" 4 "28～42" 5 "42～56" 6 "56～70" 7 "70～84") ///
              ti(示例数据, size(*0.5) pos(11) color(black)) color(black)) ///
      label(data(li-all_db) x(x_centroid) y(y_centroid) l(name) color(gs10) size(*0.8 ...)) ///
      line(data(li-all_coord) size(*0.2 ...) color(black))
gr export "li-all.png", replace
