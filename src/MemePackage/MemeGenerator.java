package MemePackage;

import DAO.MemeDAO;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.font.GlyphVector;
import java.awt.font.TextLayout;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class MemeGenerator {
    public static String generateMeme(File img, String upperText, String lowerText) throws IOException, SQLException, ClassNotFoundException {
        final BufferedImage image = ImageIO.read(img);
        int k = image.getWidth() / 18;
        Graphics g = image.getGraphics();
        Font font = new Font("Lobster 1.4", Font.PLAIN, k);
        g.setFont(font);
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(
                RenderingHints.KEY_TEXT_ANTIALIASING,
                RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        g2d.setRenderingHint(
                RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY);
        FontMetrics fontMetrics = g2d.getFontMetrics(font);

        int upperTextWidth = getLineWidth(fontMetrics, upperText);
        int lowerTextWidth = getLineWidth(fontMetrics, lowerText);
        int imageWidth = image.getWidth();
        int imageHeight = image.getHeight();

        ArrayList<String> upperLines = getLines(upperTextWidth, imageWidth, upperText);
        ArrayList<String> lowerLines = getLines(lowerTextWidth, imageWidth, lowerText);

        drawLines(upperLines, imageWidth, imageHeight, fontMetrics, g, true, k);
        drawLines(lowerLines, imageWidth, imageHeight, fontMetrics, g, false, k);
        g.dispose();

        int number = MemeDAO.getMaxImgID() + 1;
        ImageIO.write(image, "jpg", new File("/Users/rodionkub/Downloads/apache-tomcat-8.5.47/memolenta/memes/meme" + number + ".jpg"));
        return "meme" + number + ".jpg";
    }

    private static void drawLines(ArrayList<String> lines, int imageWidth, int imageHeight, FontMetrics fontMetrics, Graphics g, boolean upper, int k) {
        for (int i = 0; i < lines.size(); i++) {
            int x = imageWidth / 2 - getLineWidth(fontMetrics, lines.get(i)) / 2;
            int y;
            if (upper) {
                y = imageHeight / 10 + i * k;
            }
            else {
                y = imageHeight  - (lines.size() - i) * k;
            }
            drawOutline(g, lines.get(i), x, y);
            g.drawString(lines.get(i), x, y);
        }
    }

    private static ArrayList<String> getLines(int textWidth, int imageWidth, String text) {
        ArrayList<String> lines = new ArrayList<>();
        if (textWidth > imageWidth) {
            int k = textWidth / (imageWidth - 100);
            int charWidth = textWidth / text.length();
            ArrayList<String> words = new ArrayList<>(Arrays.asList(text.split(" ")));
            for (int i = 0; i <= k; i++) {
                String line = "";
                int j;
                for (j = 0; j < words.size(); j++) {
                    String word = words.get(j);
                    String backupLine = "" + line;
                    line = line.concat(word + " ");
                    if (line.length() * charWidth > imageWidth - 100) {
                        line = backupLine;
                        break;
                    }
                }
                for (int j1 = 0; j1 < j; j1++) {
                    words.remove(0);
                }
                lines.add(line);
            }
        }
        else {
            lines.add(text);
        }
        return lines;
    }
    private static void drawOutline(Graphics g, String text, int x, int y) {
        g.setColor(Color.black);
        g.drawString(text, x + 1, y - 1);
        g.drawString(text, x + 1, y + 1);
        g.drawString(text, x - 1, y - 1);
        g.drawString(text, x - 1, y + 1);
        g.setColor(Color.white);
    }

    private static int getLineWidth(FontMetrics fontMetrics, String text) {
        int width = 0;
        for (int i = 0; i < text.length(); i++) {
            width += fontMetrics.charWidth(text.charAt(i));
        }
        return width;
    }
}
