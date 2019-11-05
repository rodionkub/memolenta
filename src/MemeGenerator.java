import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.font.GlyphVector;
import java.awt.font.TextLayout;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;

public class MemeGenerator {
    public static void main(String[] args) throws Exception {
        final BufferedImage image = ImageIO.read(new File("src/MemeTemplates/meme1.jpg"));

        Graphics g = image.getGraphics();
        Font font = new Font("Lobster 1.4", Font.PLAIN, 30);
        g.setFont(font);
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(
                RenderingHints.KEY_TEXT_ANTIALIASING,
                RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        g2d.setRenderingHint(
                RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY);
        FontMetrics fontMetrics = g2d.getFontMetrics(font);

        String upperText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque metus libero, pharetra eu sapien vel, porttitor facilisis orci.";
        String lowerText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque metus libero, pharetra eu sapien vel, porttitor facilisis orci.";
        int upperTextWidth = getLineWidth(fontMetrics, upperText);
        int lowerTextWidth = getLineWidth(fontMetrics, lowerText);
        int imageWidth = image.getWidth();
        int imageHeight = image.getHeight();

        ArrayList<String> upperLines = getLines(upperTextWidth, imageWidth, upperText);
        ArrayList<String> lowerLines = getLines(lowerTextWidth, imageWidth, lowerText);

        drawLines(upperLines, imageWidth, imageHeight, fontMetrics, g, true);
        drawLines(lowerLines, imageWidth, imageHeight, fontMetrics, g, false);
        g.dispose();

        ImageIO.write(image, "png", new File("src/test.png"));
        Runtime.getRuntime().exec("open src/test.png");
    }

    private static void drawLines(ArrayList<String> lines, int imageWidth, int imageHeight, FontMetrics fontMetrics, Graphics g, boolean upper) {
        for (int i = 0; i < lines.size(); i++) {
            int x = imageWidth / 2 - getLineWidth(fontMetrics, lines.get(i)) / 2;
            int y;
            if (upper) {
                y = imageHeight / 10 + i * 30;
            }
            else {
                y = imageHeight * 11 / 10  - (lines.size() - i + 1) * 30;
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
