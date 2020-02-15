package rml.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import rml.model.Family;
import rml.service.FamilyService;
import rml.vo.Factory.FamilyFactory;
import rml.vo.FamilyVO;
import rml.vo.PageVO;
import rml.vo.Result;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/family")
public class FamilyController {
    @Resource
    private FamilyService familyService;

    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView init(FamilyVO familyVO) {
        PageVO page = new PageVO();
        ModelAndView view = new ModelAndView("familyList");
        long count = familyService.getCount(familyVO);
        if (count > 0) {
            List<FamilyVO> familyList = familyService.getList(familyVO);
            view.addObject("familyList", familyList);
        }
        page.calculate(familyVO.getPage(), familyVO.getPageSize(), count);
        view.addObject("page", page);
        view.addObject("familyVO", familyVO);
        return view;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result add(FamilyVO familyVO) {
        Family family = FamilyFactory.INSTANCE.convertFromFamilyVO(familyVO);
        familyService.add(family);
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }

    @RequestMapping(value = "/edite", method = RequestMethod.POST)
    @ResponseBody
    public Result edite(FamilyVO familyVO) {
        Family family = FamilyFactory.INSTANCE.convertFromFamilyVO(familyVO);
        familyService.update(family);
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }
}
