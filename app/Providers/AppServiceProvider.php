<?php

namespace App\Providers;

use App\Services\LogTools\Interfaces\LogToolsInterface;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->app->bind(LogToolsInterface::class, LogToolsInterface::class);
    }
}
