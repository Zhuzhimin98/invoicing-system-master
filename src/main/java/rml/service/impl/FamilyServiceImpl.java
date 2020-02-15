package rml.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import rml.dao.FamilyMapper;
import rml.model.Family;
import rml.service.FamilyService;
import rml.util.SeqEnum;
import rml.vo.Factory.FamilyFactory;
import rml.vo.FamilyVO;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("familyService")
public class FamilyServiceImpl extends BaseServiceImpl implements FamilyService {
    @Resource
    private FamilyMapper familyMapper;

    @Override
    public FamilyVO getById(Long id) {
        Family family = familyMapper.getById(id);
        if (family == null) {
            return null;
        }

        return FamilyFactory.INSTANCE.convertToFamilyVO(family);
    }

    @Override
    public long getCount(FamilyVO vo) {
        Long count = familyMapper.getCount(vo);
        if (count == null) {
            return 0;
        }
        return count;
    }

    @Override
    public List<FamilyVO> getList(FamilyVO vo) {
        List<Family> familyList = familyMapper.getList(vo);
        if (CollectionUtils.isEmpty(familyList)) {
            return null;
        }
        List<FamilyVO> list = new ArrayList<FamilyVO>();
        for (Family family : familyList) {
            list.add(FamilyFactory.INSTANCE.convertToFamilyVO(family));
        }
        return list;
    }

    @Override
    public List<FamilyVO> getAllList() {
        List<Family> familyList = familyMapper.getAll();
        if (CollectionUtils.isEmpty(familyList)) {
            return null;
        }
        List<FamilyVO> list = new ArrayList<FamilyVO>();
        for (Family family : familyList) {
            list.add(FamilyFactory.INSTANCE.convertToFamilyVO(family));
        }
        return list;
    }

    @Override
    public boolean add(Family family) {
        Long familyId = null;
        int tiems = 0;
        while (familyId == null) {
            if (tiems > 3) return false;
            familyId = getNextSequence(SeqEnum.VENDER_ID.getKey());
            tiems++;
        }
        family.setId(familyId);
        familyMapper.add(family);
        return true;
    }

    @Override
    public boolean update(Family family) {
        familyMapper.update(family);
        return true;
    }
}
