package edu.gdut.imis.byf3114004859.modules.race.dto;

/**
 * Created by Yunfei on 2017/12/26.
 */
public class RoundDto {

    private Long competitionId;
    private Player guest;
    private Player host;

    public Long getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(Long competitionId) {
        this.competitionId = competitionId;
    }

    public Player getGuest() {
        return guest;
    }

    public void setGuest(Player guest) {
        this.guest = guest;
    }

    public Player getHost() {
        return host;
    }

    public void setHost(Player host) {
        this.host = host;
    }

    class Player{
        private int id;
        private int point;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getPoint() {
            return point;
        }

        public void setPoint(int point) {
            this.point = point;
        }
    }
}
