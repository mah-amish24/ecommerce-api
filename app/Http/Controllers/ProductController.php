<?php
namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $products = $request->user->products()->paginate(10);
        return response()->json($products);
    }

    public function store(ProductRequest $request)
    {
        $updateData = $request->only([ 'name','description','price','user_id', ]);
        $file = $request->file('image');
        $originalName = $file->getClientOriginalName();
        $path = $file->storeAs('', $originalName, 'public');
        $updateData['image'] = $path;
        $product->update($updateData);
        
        /* $product = $request->user->products()->create($request->all());
          return response()->json($product, 201);
        $profile = new Profile();
        $profile->name = $request->name;
        $profile->email = $request->email;
        $profile->image_path = $request->file('image'); // This will trigger the mutator

        $profile->save();*/
    }

    public function show(Request $request, Product $product)
    {
        if ($request->user->id !== $product->user_id) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        return response()->json($product);
    }

    public function update(ProductRequest $request, Product $product)
    {
        if ($request->user->id !== $product->user_id) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $product->update($request->all());
        return response()->json($product);
    }

    public function destroy(Request $request, Product $product)
    {
        if ($request->user->id !== $product->user_id) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $product->delete();
        return response()->json(null, 204);
    }
}
