package cat.udl.eps.entsoftarch.webingogeiapi.steps;

import cucumber.api.java.en.When;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

public class ListGameStepdefs {

    private static final Logger logger = LoggerFactory.getLogger(RegisterPlayerStepDef.class);

    @Autowired
    private StepDefs stepDefs;

    @When("^I try to list games$")
    public void iTryToListGames() throws Throwable{
        stepDefs.result = stepDefs.mockMvc
                .perform(get("/games")
                        .accept(MediaType.APPLICATION_JSON)
                        .with(AuthenticationStepDefs.authenticate()))
                .andDo(print());
    }
}
