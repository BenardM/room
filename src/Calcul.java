import java.util.Random;

public class Calcul extends Enigme {

    private int tabResultats[];
    private String tabCalculs[];

    public Calcul (String name) {
        super(name, False);
        genererCalculs();
    }

    public void genererCalculs() {
        char tabOperateurs[] = {'+', '-', '*', '/'};

        Random rdm = new Random();

        for (int i = 0; i < 2; i++) {
            this.tabResultats[i] = rdm.nextInt(100) + tabOperateurs[rdm.nextInt(4)] + rdm.nextInt(100);
            this.tabCalculs[i] = Integer.toString(rdm.nextInt(100)) + tabOperateurs[rdm.nextInt(4)] + Integer.toString(rdm.nextInt(100));
        }

    }
}



