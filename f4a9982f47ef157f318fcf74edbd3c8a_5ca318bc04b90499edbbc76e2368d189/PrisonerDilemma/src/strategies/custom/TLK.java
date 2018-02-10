package strategies.custom;

import main.History;
import main.Variables;

public class TLK {

    public String calculate(History h){
        if (h.getCurrentRound()== 0) { return Variables.COOPERATE; }
        else { return Variables.DEFECT; }
    }
}
