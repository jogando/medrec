import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CanActivateGuard } from './services/guard.service';

// Components
import { HomeComponent } from './pages/home/home.component';
import { HealthSheetComponent } from './pages/health-sheet/health-sheet.component';
import { LayoutsAuthComponent } from './pages/layouts/auth/auth';
import { LoginComponent } from './pages/login/login.component';


const routes: Routes = [
  // logged routes
  {
    canActivate: [CanActivateGuard],
    children: [
      {
        canActivate: [CanActivateGuard],
        component: HomeComponent,
        path: 'home'
      },
      {
        canActivate: [CanActivateGuard],
        component: HealthSheetComponent,
        path: 'health-sheet/:id/:version'
      }
    ],
    component: LayoutsAuthComponent,
    path: '',
  },
  // not logged routes
  {
    component: LoginComponent,
    path: 'login'
  }
];

export const routing: ModuleWithProviders = RouterModule.forRoot(routes);
