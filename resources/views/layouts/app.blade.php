<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'YVR GRP Project')</title>

    @vite(['resources/css/app.css', 'resources/js/app.js'])

    @yield('styles')
</head>
<body>

<header>
    <h1>@yield('header_title', 'YVR GRP Project')</h1>
    @yield('header_subtitle')
</header>

@yield('content')

@yield('scripts')

</body>
</html>
