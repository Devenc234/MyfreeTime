package strategies.custom;

import main.History;
import main.Variables;

public class DEFECT_THIRD {

    public String calculate(History h){
        if(h.getCurrentRound() < 2) return Variables.COOPERATE;
        return Variables.DEFECT;
    }
}
