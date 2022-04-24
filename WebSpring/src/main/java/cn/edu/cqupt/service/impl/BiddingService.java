package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.IBiddingDao;
import cn.edu.cqupt.domain.Bidding;
import cn.edu.cqupt.service.IBiddingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bidding")
public class BiddingService implements IBiddingService {

    @Autowired
    private IBiddingDao biddingDao;

    @Override
    public void postBidding(Bidding bidding) {
        biddingDao.insertBidding(bidding);
    }

    @Override
    public List<Bidding> showBidding(Integer pageId) {
        return biddingDao.selectAllBiddingByPage((pageId - 1) * 5);
    }

    @Override
    public Bidding showBiddingDetail(Integer biddingId) {
        return biddingDao.selectBiddingByBiddingId(biddingId);
    }

    @Override
    public Integer getMaxPageId() {
        Integer maxPageId = biddingDao.countBidding();
        if (maxPageId % 5 == 0){
            return maxPageId/5;
        } else {
            return maxPageId/5 + 1;
        }
    }
}
