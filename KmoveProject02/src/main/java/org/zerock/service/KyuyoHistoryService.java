package org.zerock.service;

import org.zerock.domain.KyuyoHistoryVO;

public interface KyuyoHistoryService {
	// public KyuyoHistoryVO getListByKizokuYm(String shain_no, String kizoku_ym);
	KyuyoHistoryVO readSikyuWithShainNo(String shain_no);
}
