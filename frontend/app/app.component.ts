import { Component } from '@angular/core';

import './rxjs-operators';

import { UserService } from './user/user.service';
import { BudgetService } from './budget/budget.service';
import { WindowService } from './window/window.service';

@Component({
  selector: 'budget-app',
  templateUrl: '/app/app.component.html',
  styleUrls: ['../app/app.component.css'], //styleUrls doesn't accept root path: https://github.com/angular/angular/issues/4974
  providers: [UserService, BudgetService, WindowService]
})

export class AppComponent {
  
  constructor(
    private userService: UserService
  ) {} 
   
}
