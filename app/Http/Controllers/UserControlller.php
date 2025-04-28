<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Validation\Rules;

use App\Models\User;
use App\Models\Role;
use Illuminate\Support\Facades\Hash;

class UserControlller extends Controller
{
    public function index()
    {
        $usuarios = User::with('role')->get();

         // Ver los datos antes de enviarlos a la vista
       /*  dd($usuarios); */
        return view('usuarios.index', compact('usuarios'));
    }

    public function create()
    {
        $roles = Role::all();
        return view('usuarios.create', compact('roles'));
    }

    public function store(Request $request)
    {
        /* dd($request->all()); */

        $request->validate([
            'nombres' => ['required', 'string', 'max:255'],
            'apellidos' => ['required', 'string', 'max:255'],
            'telefono' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'role_id' => ['required', 'integer'],
            'foto' => ['nullable','image','mimes:jpeg,png,jpg','max:2048'],
        ]);

        $fotoPath = null;
        if ($request->hasFile('foto')) {
            $fotoPath = $request->file('foto')->store('fotos','public');
        }

        $user = User::create([
            'nombres' => $request->nombres,
            'apellidos' => $request->apellidos,
            'telefono' => $request->telefono,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role_id' => $request->role_id,
            'foto' => $fotoPath,
        ]);

        return redirect()->route('usuarios.index')->with('success', 'Registro creado correctamente');
    }

    public function edit($id)
    {
        $usuario = User::findOrFail($id);
        $roles = Role::all();
        return view('usuarios.edit', compact('usuario', 'roles'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nombres' => ['required', 'string', 'max:255'],
            'apellidos' => ['required', 'string', 'max:255'],
            'telefono' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'.$id],
            'role_id' => ['required', 'integer'],
            'foto' => ['nullable','image','mimes:jpeg,png,jpg','max:2048'],
        ]);

        $usuario = User::findOrFail($id);


        if ($request->hasFile('foto')) {
            $fotoPath = $request->file('foto')->store('fotos','public');
            $usuario->foto = $fotoPath;
        }

        $usuario->update([
            'nombres' => $request->nombres,
            'apellidos' => $request->apellidos,
            'telefono' => $request->telefono,
            'email' => $request->email,
            'role_id' => $request->role_id,
        ]);

        return redirect()->route('usuarios.index')->with('success', 'Usuario actualizado correctamente');
    }

    public function destroy($id)
    {
        $usuario = User::findOrFail($id);
        $usuario->delete();
        return redirect()->route('usuarios.index')->with('success', 'Usuario eliminado correctamente');
    }

    public function show($id)
    {
        // Buscar el usuario por ID
        $usuario = User::findOrFail($id); // Retorna 404 si no encuentra el usuario
        // Retornar la vista con los detalles del usuario
        return view('usuarios.show', compact('usuario'));
    }
}
