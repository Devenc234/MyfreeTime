package strategies.custom;

import main.History;
import main.Variables;

public class ALWAYS_DEFECT {

    public String calculate(History h){
        return Variables.DEFECT;
    }
}
