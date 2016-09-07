<div class="side-menu sidebar-inverse">
    <nav class="navbar navbar-default" role="navigation">
        <div class="side-menu-container">
            <div class="navbar-header">
                <?= $this->Html->link('<div class="icon fa fa-paper-plane"></div><div class="title">' . h(App\Core\Setting::read('App.Name')) . '</div>', ['controller' => 'Dashboard', 'action' => 'index'], ['escape' => false, 'class' => 'navbar-brand'])?>
                <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                    <i class="fa fa-times icon"></i>
                </button>
            </div>
            <ul class="nav navbar-nav">
            <?php
                echo $this->Menu->link('<span class="icon fa fa-tachometer"></span><span class="title">' . __('Dashboard') . '</span>', 
                    ['controller' => 'Dashboard', 'action' => 'index'],
                    ['escape' => false]
                );
                echo $this->Menu->groupLink('<span class="icon fa fa-gears"></span><span class="title">' . __('System') . '</span>', [
                        [__('Roles'), ['controller' => 'Roles', 'action' => 'index']],
                        [__('Users'), ['controller' => 'Users', 'action' => 'index']]
                    ]
                );

            ?>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</div>
