package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.Bidding;

import java.util.List;

public interface IBiddingDao {
    void insertBidding(Bidding bidding);
    List<Bidding> selectAllBiddingByPage(Integer biddingNodeId);
    Bidding selectBiddingByBiddingId(Integer biddingId);
    Integer countBidding();
}
