local Translations = {
    error = {
        nopolice = 'Police only!',
        started = 'Started your service. you need to do %{value} task(s)..',
        todo = '%{value} tasks to go..',
        no = 'HEY! thats not good, you will need to do %{value} more.',
        canceled = 'Stopped'
    },
    success = {
        taskdone = 'You have done all your tasks'
    },
    info = {
        deliverbox = 'deliver box',
    },
    command = {
        fillallfield = 'Fill all arguments',
        filltaskamount = 'How much times he needs to do the task?',
        service = 'Give a player a servicetask',
        id = 'ID',
        task = 'Task',
        amount = 'How much does he needs to do?'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
