package com.ruoyi.business.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.PreAuthorize;
import com.ruoyi.business.domain.Device;
import com.ruoyi.business.service.IDeviceService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 设备Controller
 *
 * @author ruoyi
 * @date 2021-01-31
 */
@RestController
@RequestMapping("/device")
public class DeviceController extends BaseController {
    @Autowired
    private IDeviceService deviceService;

    /**
     * 查询设备列表
     */
    @PreAuthorize(hasPermi = "business:device:list")
    @GetMapping("/list")
    public TableDataInfo list(Device device) {
        startPage();
        List<Device> list = deviceService.selectDeviceList(device);
        return getDataTable(list);
    }

    /**
     * 导出设备列表
     */
    @PreAuthorize(hasPermi = "business:device:export")
    @Log(title = "设备", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Device device) throws IOException {
        List<Device> list = deviceService.selectDeviceList(device);
        ExcelUtil<Device> util = new ExcelUtil<Device>(Device.class);
        util.exportExcel(response, list, "device");
    }

    /**
     * 获取设备详细信息
     */
    @PreAuthorize(hasPermi = "business:device:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(deviceService.selectDeviceById(id));
    }

    /**
     * 新增设备
     */
    @PreAuthorize(hasPermi = "business:device:add")
    @Log(title = "设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Device device) {
        return toAjax(deviceService.insertDevice(device));
    }

    /**
     * 修改设备
     */
    @PreAuthorize(hasPermi = "business:device:edit")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Device device) {
        return toAjax(deviceService.updateDevice(device));
    }

    /**
     * 删除设备
     */
    @PreAuthorize(hasPermi = "business:device:remove")
    @Log(title = "设备", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(deviceService.deleteDeviceByIds(ids));
    }
}
