<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\Contracts\Repositories\GreenBilling\UserRepository;

class ExampleTest extends TestCase
{


    function tearDown()
    {
        Mockery::close();
    }

    /**
     * A basic functional test example.
     *
     * @return void
     */
    public function testBasicExample()
    {
//        $this->visit('/')
//             ->see('Laravel 5');

        // example 1

//        $userRepository = Mockery::mock('App\Contracts\Repositories\GreenBilling\UserRepository');
//        $userRepository->shouldReceive('all')->once()->andReturn('mocked');
//
//
//        $user = new \App\Http\Controllers\UserController($userRepository);
//        $this->assertEquals('mocked', $user->index());


        // example 1 ends here




        /**
         * Example 2
         */

//        $userRepository = Mockery::mock('App\Contracts\Repositories\GreenBilling\UserRepository');
//         $userRepository->shouldReceive('all')->with(['created_at'])->once()->andReturn('mocked');
//         \Illuminate\Support\Facades\App::instance(UserRepository::class, $userRepository);
//
//        $user = new \App\Http\Controllers\UserController($userRepository);
//
//        $this->assertEquals('mocked',$user->index());

        /**
         * Example 2 ends here
         */



        /**
         * Example 3
         *
         */



        $userRepository = Mockery::mock(UserRepository::class);
        dd($userRepository);



    }
}
