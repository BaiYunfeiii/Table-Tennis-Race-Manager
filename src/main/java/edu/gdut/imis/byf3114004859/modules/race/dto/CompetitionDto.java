package edu.gdut.imis.byf3114004859.modules.race.dto;

import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.GroundEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.RoundEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.GroundService;
import edu.gdut.imis.byf3114004859.modules.race.service.PointService;
import edu.gdut.imis.byf3114004859.modules.race.service.RoundService;
import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Yunfei on 2017/12/11.
 */
@Component
public class CompetitionDto{

    @Autowired
    RoundService roundService;
    @Autowired
    SysUserService sysUserService;
    @Autowired
    GroundService groundService;

    public CompetitionDto(){

    }

    public CompetitionDto(CompetitionEntity competition){

    }

    private Long id;

    private String name;

    private Player winner;

    private Player host;

    private Player guest;

    private Ground ground;

    private List<Point> points ;

    private int status;

    public void setId(Long id){
        this.id = id;
    }
    public Long getId(){
        return this.id;
    }
    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return this.name;
    }
    public void setWinner(SysUserEntity winner, Integer point){
        this.winner = new Player(winner, point);
    }
    public void setWinner(Player player){
        this.winner = player;
    }
    public Player getWinner(){
        return this.winner;
    }
    public void setHost(SysUserEntity host, Integer point){
        this.host = new Player(host, point);
    }
    public Player getHost(){
        return this.host;
    }
    public void setGuest(SysUserEntity guest, Integer point){
        this.guest = new Player(guest,point);
    }
    public Player getGuest(){
        return this.guest;
    }
    public void setGround(GroundEntity ground){
        this.ground = new Ground(ground);
    }
    public Ground getGround(){
        return this.ground;
    }
    public void setPoints(List<Point> points){
        this.points = points;
    }
    public List<Point> getPoints(){
        return this.points;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public CompetitionDto build(CompetitionEntity competition) {
        CompetitionDto dto = new CompetitionDto();
        dto.id = competition.getId();
        dto.name = competition.getName();
        dto.setGround(groundService.queryObject(competition.getGroundId()));
        dto.setGuest(sysUserService.queryObject(competition.getGuestId()), competition.getGuestPoint());
        dto.setHost(sysUserService.queryObject(competition.getHostId()), competition.getHostPoint());
        dto.setPoints(new ArrayList<>());
        dto.setStatus(competition.getStatus());
        if(competition.isStarted()){
            List<RoundEntity> roundEntityList = roundService.queryByCompetition(competition.getId());
            for (RoundEntity round :
                    roundEntityList) {
                Point p = new Point();
                p.setHost(round.getHostPoint());
                p.setGuest(round.getGuestPoint());
                p.setOrder(round.getOrder());
                p.setId(round.getRoundId());
                dto.points.add(p);
            }
        }
        if(competition.isEnd()){
            dto.setWinner(competition.getWinnerId() == competition.getGuestId() ?
                    dto.getGuest() : dto.getHost());
        }
        return dto;
    }

    private class Point {
        private Long id;

        private Integer order;

        private int host;

        private int guest;

        public void setId(Long id){
            this.id = id;
        }
        public Long getId(){
            return this.id;
        }
        public void setOrder(Integer order){
            this.order = order;
        }
        public Integer getOrder(){
            return this.order;
        }
        public void setHost(int host){
            this.host = host;
        }
        public int getHost(){
            return this.host;
        }
        public void setGuest(int guest){
            this.guest = guest;
        }
        public int getGuest(){
            return this.guest;
        }
    }

    private class Player{
        private String id;

        private String name;

        private Integer point;

        public Player(SysUserEntity user, Integer point){
            this.setId(user.getUserId().toString());
            setName(user.getRealName());
            setPoint(point);
        }

        public void setId(String id){
            this.id = id;
        }
        public String getId(){
            return this.id;
        }
        public void setName(String name){
            this.name = name;
        }
        public String getName(){
            return this.name;
        }

        public Integer getPoint() {
            return point;
        }

        public void setPoint(Integer point) {
            this.point = point;
        }
    }

    private class Ground{
        private String id;

        private String name;

        public void setId(String id){
            this.id = id;
        }
        public String getId(){
            return this.id;
        }
        public void setName(String name){
            this.name = name;
        }
        public String getName(){
            return this.name;
        }

        public Ground(GroundEntity groundEntity){
            this.id = groundEntity.getId().toString();
            this.name = groundEntity.getName();
        }
    }

}
