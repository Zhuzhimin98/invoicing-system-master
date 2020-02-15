package rml.service;

import rml.model.Vender;
import rml.vo.VenderVO;

import java.util.List;

public interface VenderService {

    VenderVO getById(Long id);

    long getCount(VenderVO vo);

    List<VenderVO> getList(VenderVO vo);

    List<VenderVO> getAllList();

    boolean add(Vender vender);

    boolean update(Vender vender);
}
