public with sharing class TaskCreator {

    public static Task createTask(String subject, ID id) {
        return new Task(
            Subject = subject,
            WhatId = id
        );
    }

}
