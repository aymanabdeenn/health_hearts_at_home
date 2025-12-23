package com.a3m.hhah.services;

import com.a3m.hhah.entities.Child;
import com.a3m.hhah.entities.HealthRecord;
import com.a3m.hhah.entities.resources.ReadingType;
import com.a3m.hhah.repositories.HealthRecordRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class HealthRecordService {

    private final HealthRecordRepository healthRecordRepository;
    private final ChildService childService;

    @Autowired
    public HealthRecordService(HealthRecordRepository healthRecordRepository, ChildService childService) {
        this.healthRecordRepository = healthRecordRepository;
        this.childService = childService;
    }

    @Transactional
    public HealthRecord addHealthRecord(Long childId, float weight, float bloodPressure, float oxPulse) {
        Child child = childService.getChildById(childId);
        HealthRecord record = new HealthRecord(child, weight, bloodPressure, oxPulse, LocalDateTime.now());

        record.setChild(child);
        child.getRecords().add(record);

        return healthRecordRepository.save(record);
    }

    public float getReading(Long childId, ReadingType readingType){
        Child child = childService.getChildById(childId);
        List<HealthRecord> records = child.getRecords();
        switch (readingType){
            case ReadingType.WEIGHT: return records.get(records.size()-1).getWeight();
            case ReadingType.BLOOD_PRESSURE: return records.get(records.size()-1).getBloodPressure();
            case ReadingType.OX_PULSE: return records.get(records.size()-1).getOxPulse();
        }
        return 0;
    }
}
