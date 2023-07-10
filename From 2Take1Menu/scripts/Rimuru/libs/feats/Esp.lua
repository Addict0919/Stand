function drawHeart(x, y, w, h) --Stole from my cod source, made by soul
    scriptdraw.draw_line(v2(x + (w / 100 * 0), y + (h / 100 * 45)), v2(x + (w / 100 * 10), y + (h / 100 * 18)), 1, RGBAToInt(255, 0, 0, 255))
    scriptdraw.draw_line(v2(x + (w / 100 * 100), y + (h / 100 * 45)), v2(x + (w / 100 * 90), y + (h / 100 * 18)), 1, RGBAToInt(255, 0, 0, 255))
    scriptdraw.draw_line(v2(x + (w / 100 * 10), y + (h / 100 * 18)), v2(x + (w / 100 * 30), y + (h / 100 * 9)), 1, RGBAToInt(255, 0, 0, 255))
    scriptdraw.draw_line(v2(x + (w / 100 * 90), y + (h / 100 * 18)), v2(x + (w / 100 * 70), y + (h / 100 * 9)), 1, RGBAToInt(255, 0, 0, 255))
    scriptdraw.draw_line(v2(x + (w / 100 * 30), y + (h / 100 * 9)), v2(x + (w / 100 * 50), y + (h / 100 * 20)), 1, RGBAToInt(255, 0, 0, 255))
    scriptdraw.draw_line(v2(x + (w / 100 * 70), y + (h / 100 * 9)), v2(x + (w / 100 * 50), y + (h / 100 * 20)), 1, RGBAToInt(255, 0, 0, 255))
    scriptdraw.draw_line(v2(x + (w / 100 * 0), y + (h / 100 * 45)), v2(x + (w / 100 * 50), y + (h / 100 * 93)), 1, RGBAToInt(255, 0, 0, 255))
    scriptdraw.draw_line(v2(x + (w / 100 * 100), y + (h / 100 * 45)), v2(x + (w / 100 * 50), y + (h / 100 * 93)), 1, RGBAToInt(255, 0, 0, 255))
end


