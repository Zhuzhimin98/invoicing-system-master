package rml.service;

import rml.model.Family;
import rml.vo.FamilyVO;

import java.util.List;

public interface FamilyService {

    FamilyVO getById(Long id);

    long getCount(FamilyVO vo);

    List<FamilyVO> getList(FamilyVO vo);

    List<FamilyVO> getAllList();

    boolean add(Family family);

    boolean update(Family family);
}
