package strategies.custom;

import main.History;
import main.Variables;

public class ALWAYS_COOPERATE {

    public String calculate(History h){
        return Variables.COOPERATE;
    }
}
