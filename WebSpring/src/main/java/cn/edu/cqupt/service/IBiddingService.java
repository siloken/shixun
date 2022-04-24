package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.Bidding;

import java.util.List;

public interface IBiddingService {
    void postBidding(Bidding bidding);
    List<Bidding> showBidding(Integer pageId);
    Bidding showBiddingDetail(Integer biddingId);
    Integer getMaxPageId();
}
