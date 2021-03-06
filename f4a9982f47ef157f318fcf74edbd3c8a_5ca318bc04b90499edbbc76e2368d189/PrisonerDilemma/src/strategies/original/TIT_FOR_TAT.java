package strategies.original;

import main.History;
import main.Variables;

public class TIT_FOR_TAT {

    public String calculate(History h) {
        if (h.getCurrentRound() != 0) {
            String[] previousOutputs = h.getMatchScore()[h.getCurrentRound() - 1];
            if (previousOutputs[1].equals(Variables.COOPERATE)) {
                return Variables.COOPERATE;
            } else {
                return Variables.DEFECT;
            }
        }
        return Variables.COOPERATE;
    }
}
