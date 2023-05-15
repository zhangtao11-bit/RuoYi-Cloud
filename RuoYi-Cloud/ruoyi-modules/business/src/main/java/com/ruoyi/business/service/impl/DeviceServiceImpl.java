package com.ruoyi.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.DeviceMapper;
import com.ruoyi.business.domain.Device;
import com.ruoyi.business.service.IDeviceService;

/**
 * 设备Service业务层处理
 *
 * @author ruoyi
 * @date 2021-01-31
 */
@Service
public class DeviceServiceImpl implements IDeviceService {
    @Autowired
    private DeviceMapper deviceMapper;

    /**
     * 查询设备
     *
     * @param id 设备ID
     * @return 设备
     */
    @Override
    public Device selectDeviceById(Long id) {
        return deviceMapper.selectDeviceById(id);
    }

    /**
     * 查询设备列表
     *
     * @param device 设备
     * @return 设备
     */
    @Override
    public List<Device> selectDeviceList(Device device) {
        return deviceMapper.selectDeviceList(device);
    }

    /**
     * 新增设备
     *
     * @param device 设备
     * @return 结果
     */
    @Override
    public int insertDevice(Device device) {
        return deviceMapper.insertDevice(device);
    }

    /**
     * 修改设备
     *
     * @param device 设备
     * @return 结果
     */
    @Override
    public int updateDevice(Device device) {
        return deviceMapper.updateDevice(device);
    }

    /**
     * 批量删除设备
     *
     * @param ids 需要删除的设备ID
     * @return 结果
     */
    @Override
    public int deleteDeviceByIds(Long[] ids) {
        return deviceMapper.deleteDeviceByIds(ids);
    }

    /**
     * 删除设备信息
     *
     * @param id 设备ID
     * @return 结果
     */
    @Override
    public int deleteDeviceById(Long id) {
        return deviceMapper.deleteDeviceById(id);
    }
}
