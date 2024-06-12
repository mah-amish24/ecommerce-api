<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Token;

class AuthToken
{
    public function handle(Request $request, Closure $next)
    {
        $token = $request->header('Authorization');

        if (!$token || !($tokenModel = Token::where('token', $token)->where('expires_at', '>', now())->first())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $request->merge(['user' => $tokenModel->user]);

        return $next($request);
    }
}
