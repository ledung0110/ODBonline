package utilities;

import dal.DebtDao;
import dal.DebtDetailDao;
import entities.Debt;
import entities.DebtDetail;
import entities.MailRequest;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

/**
 *
 * @author nvash
 */
public class TotalDebtService {

    private BlockingQueue<DebtDetail> debtDetailQueue = new LinkedBlockingQueue<>();
    private ExecutorService executor = Executors.newFixedThreadPool(10);

    public void calTotalDebt(DebtDetail debtDetail) {
        new DebtDetailDao().addDebtDetail(debtDetail);
        debtDetailQueue.offer(debtDetail);
        executor.execute(new CalTotalDebt(debtDetailQueue));
    }
}

class CalTotalDebt implements Runnable {

    private volatile boolean stop;
    private BlockingQueue<DebtDetail> debtDetailQueue;

    public CalTotalDebt(BlockingQueue<DebtDetail> debtDetailQueue) {
        this.debtDetailQueue = debtDetailQueue;
        this.stop = false;
    }

    public void stop() {
        stop = true;
    }

    @Override
    public void run() {
        while (!stop) {
            try {
                DebtDetail debtDetail = debtDetailQueue.take();
                DebtDao dao = new DebtDao();
                Debt debt = dao.getDebtByID(debtDetail.getDebtId());
                double total = debt.getTotalDebt();
                if (debtDetail.isDebtType()) {
                    total += debtDetail.getAmount();
                } else {
                    total -= debtDetail.getAmount();
                }
                debt.setTotalDebt(total);
                dao.updateTotalDebt(debt);
                Thread.sleep(10000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
