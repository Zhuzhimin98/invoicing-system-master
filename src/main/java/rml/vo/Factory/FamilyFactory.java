package rml.vo.Factory;

import rml.model.Family;
import rml.vo.FamilyVO;

public class FamilyFactory {
    public static final FamilyFactory INSTANCE = new FamilyFactory();

    private FamilyFactory() {
    }

    public Family convertFromFamilyVO(FamilyVO vo){
        Family family = new Family();
        family.setId(vo.getFamilyId());
        family.setName(vo.getName());
        family.setWx(vo.getWx());
        family.setTelephone(vo.getTelephone());
        family.setAddress(vo.getAddress());
        family.setSex(vo.getSex());
        return family;
    }

    public FamilyVO convertToFamilyVO(Family family){
        FamilyVO vo = new FamilyVO();
        vo.setFamilyId(family.getId());
        vo.setName(family.getName());
        vo.setWx(family.getWx());
        vo.setTelephone(family.getTelephone());
        vo.setAddress(family.getAddress());
        vo.setSex(family.getSex());
        return vo;
    }
}

