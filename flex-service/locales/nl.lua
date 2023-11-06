local Translations = {
    error = {
        nopolice = 'Je bent geen politie!',
        started = 'Taakstraf gestart. Je hebt nog %{value} taakje(s) te gaan..',
        todo = 'Nog %{value} taakjes te gaan..',
        no = 'Foei! Das een extra taakske, nog %{value} te gaan.',
        canceled = 'Geannuleerd'
    },
    success = {
        taskdone = 'Je hebt al je taken afgewerkt'
    },
    info = {
        deliverbox = 'doos inleveren',
    },
    command = {
        fillallfield = 'Vul alle argumenten in',
        filltaskamount = 'Hoeveel keer moet die taakjes doen?',
        service = 'Geef een burger een taakstraf',
        id = 'Geluksnummer',
        task = 'Taak',
        amount = 'Hoeveel moet em er der doen'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
