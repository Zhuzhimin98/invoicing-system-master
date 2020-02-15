package rml.dao;

import rml.model.Family;
import rml.vo.FamilyVO;

import java.util.List;

public interface FamilyMapper {

    Family getById(Long id);

    Long getCount(FamilyVO familyVO);

    List<Family> getList(FamilyVO familyVO);

    List<Family> getAll();

    void add(Family family);

    int update(Family vender);
}
