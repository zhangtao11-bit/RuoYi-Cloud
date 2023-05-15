package com.ruoyi.business.service;

import java.util.List;

import com.ruoyi.business.domain.Device;

/**
 * 设备Service接口
 *
 * @author ruoyi
 * @date 2021-01-31
 */
public interface IDeviceService {
    /**
     * 查询设备
     *
     * @param id 设备ID
     * @return 设备
     */
    public Device selectDeviceById(Long id);

    /**
     * 查询设备列表
     *
     * @param device 设备
     * @return 设备集合
     */
    public List<Device> selectDeviceList(Device device);

    /**
     * 新增设备
     *
     * @param device 设备
     * @return 结果
     */
    public int insertDevice(Device device);

    /**
     * 修改设备
     *
     * @param device 设备
     * @return 结果
     */
    public int updateDevice(Device device);

    /**
     * 批量删除设备
     *
     * @param ids 需要删除的设备ID
     * @return 结果
     */
    public int deleteDeviceByIds(Long[] ids);

    /**
     * 删除设备信息
     *
     * @param id 设备ID
     * @return 结果
     */
    public int deleteDeviceById(Long id);
}
