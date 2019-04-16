package cat.udl.eps.entsoftarch.webingogeiapi.domain;

import com.fasterxml.jackson.annotation.JsonIdentityReference;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import javax.persistence.Id;

import java.time.ZonedDateTime;
import java.util.ArrayList;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityReference;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class Game extends UriEntity<Integer> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private GameStatus status;
    private ArrayList<Integer> numbers;
    private Double jackpot;
    private Double pricePerCard;
    private boolean bingo;
    private boolean line;

    @ManyToOne
    private ZonedDateTime finishedAt, startAt, createdAt;

    @ManyToOne
    @JsonIdentityReference(alwaysAsId = true)
    private Admin creator;

    public void setNumbers(){
        numbers = new ArrayList<>();
        for(int i=0;i<=100; i++)
            numbers.add(i);
    }
}

