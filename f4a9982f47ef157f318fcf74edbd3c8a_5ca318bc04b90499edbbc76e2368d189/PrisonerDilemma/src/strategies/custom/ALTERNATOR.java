package strategies.custom;

import main.History;
import main.Variables;

public class ALTERNATOR {

    public String calculate(History h){
        if(h.getCurrentRound() == 0) return Variables.COOPERATE;
        if(h.getPreviousRoundScore()[0].equals(Variables.COOPERATE)) return Variables.DEFECT;
        return Variables.COOPERATE;
    }
}
