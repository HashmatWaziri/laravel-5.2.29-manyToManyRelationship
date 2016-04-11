<?php

namespace App\Http\Controllers;

use App\Contracts\Repositories\GreenBilling\RoleRepository;
use App\Contracts\Repositories\GreenBilling\UserRepository;
use App\Role;
use Illuminate\Http\Request;

use App\Http\Requests;

class UserController extends Controller
{


    private $userRepository;
    private $roleRepository;

    public function __construct(UserRepository $userRepository, RoleRepository $roleRepository)
    {
        $this->userRepository = $userRepository;
        $this->roleRepository = $roleRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {



//        return $this->userRepository->all(['created_at']);
//        // manyToMany Relationship
       $user = $this->userRepository->find(1);
        $role = $this->roleRepository->find(2);
        // In this example I am passing in a Role object but $role->id also works
        $user->roles()->attach($role);

    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = $this->userRepository->find(1);
//        $roles = $user->roles()->orderBy('name')->get();
//        return $roles;

        $role= new Role(array('name' => 'Hashmat','is_admin' => 1));

        return $user->roles()->save($role);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
