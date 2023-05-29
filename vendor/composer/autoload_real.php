<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInit67eec93e842538f6df4b96e7eefc7b98
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        spl_autoload_register(array('ComposerAutoloaderInit67eec93e842538f6df4b96e7eefc7b98', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInit67eec93e842538f6df4b96e7eefc7b98', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInit67eec93e842538f6df4b96e7eefc7b98::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}
