package strategies.built_in;

import main.History;
import main.Variables;
import java.util.Random;

public class RANDOM {

    public String calculate(History h){
        if(new Random().nextInt(100) < 50){
            return Variables.COOPERATE;
        }else{
            return Variables.DEFECT;
        }

    }
}
