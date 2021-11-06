export default class Gate{

    constructor(user){
        this.user = user;
    }

    isAdmin(){
        return this.user.type === 'admin';
    }

    isUser(){
        return this.user.type === 'user';
    }

    isAuthor(){
        return this.user.type === 'author';
    }

    isCounterMan(){
        return this.user.type === 'counter-man';
    }

    isAccountant(){
        return this.user.type === 'accountant';
    }

    isAdminorUser(){
        return this.user.type === 'admin' || this.user.type === 'user';
    }
}