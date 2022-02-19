import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import static org.junit.Assert.assertNotNull;

public class getSizeOfJar {

    @Test
    public void getSize() throws IOException {
        JarFile jf = new JarFile(new File("src/main/resources/java.jar"));
        Enumeration e = jf.entries();
        long size = 0;
        while (e.hasMoreElements()) {
            JarEntry je = (JarEntry) e.nextElement();
            String name = je.getName();
            long uncompressedSize = je.getSize();

            size+=uncompressedSize;
        }
        System.out.println(size);
        assertNotNull(null);
    }

}
