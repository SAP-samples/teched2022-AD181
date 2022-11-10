export default function OnWillUpdate(context) {   
    return context.executeAction("/UserMenu/Actions/Application/OnWillUpdate.action").then((result) => {
        if (result.data) {
            return Promise.resolve(result);
        } else {
            return Promise.reject('User Deferred');
        }
    });
}