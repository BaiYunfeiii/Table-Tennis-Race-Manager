package edu.gdut.imis.byf3114004859.modules.race.dto;

import edu.gdut.imis.byf3114004859.modules.race.entity.RaceEntity;

/**
 * Created by Yunfei on 2017/12/26.
 */
public class RaceDto extends RaceEntity {

    /**
     * 报名人数
     */
    private int count;

    public RaceDto(){

    }

    public RaceDto(RaceEntity raceEntity, int count){
        this.setId(raceEntity.getId());
        this.setStartTime(raceEntity.getStartTime());
        this.setPlace(raceEntity.getPlace());
        this.setCount(count);
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
