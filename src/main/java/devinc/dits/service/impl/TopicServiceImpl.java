package devinc.dits.service.impl;

import devinc.dits.entity.Topic;
import devinc.dits.repository.TopicRepository;
import devinc.dits.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TopicServiceImpl implements TopicService {
    TopicRepository repository;

    @Autowired
    public void setRepository(TopicRepository repository) {
        this.repository = repository;
    }

    @Transactional
    @Override
    public List<Topic> findAll() {
        return repository.findAll(Topic.class);
    }

    @Transactional
    @Override
    public void update(Topic t) {
        repository.update(t);
    }

    @Transactional
    @Override
    public void delete(Topic t) {
        repository.delete(t);
    }

    @Transactional
    @Override
    public void save(Topic t) {
        repository.save(t);
    }

    @Transactional
    @Override
    public Topic getById(int id) {
        return repository.getById(Topic.class, id);
    }
}
