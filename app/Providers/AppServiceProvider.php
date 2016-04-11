<?php

namespace App\Providers;

use App\Contracts\Repositories\GreenBilling\UserRepository;
use App\Contracts\Repositories\GreenBilling\RoleRepository;
use App\Repositories\Eloquent\GreenBilling\UserRepositoryEloquent;
use App\Repositories\Eloquent\GreenBilling\RoleRepositoryEloquent;
use Illuminate\Support\ServiceProvider;
use Prettus\Repository\Providers\RepositoryServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->register(RepositoryServiceProvider::class);
        $this->app-> bind(UserRepository::class, UserRepositoryEloquent::class); // binding interface to repository
        $this->app-> bind(RoleRepository::class, RoleRepositoryEloquent::class); // binding interface to repository
    }
}
