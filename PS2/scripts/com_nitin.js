if (com_nitin != null && typeof (com_nitin) != "object") {
    throw new Error("com_nitin already in use");
}

var com_nitin = {};
com_nitin.EVENTS = {
    NAME: "Event Handlers",
    VERSION: "1.0",
    addEventHandler: function (obj, eventType, functionListener, bCaptureBubble) {
        obj.addEventListener(eventType, functionListener, bCaptureBubble);
    }
};