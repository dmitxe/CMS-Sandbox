<?php

namespace SmartCore\Bundle\CMSBundle\Menu;

use Knp\Menu\FactoryInterface;
use Knp\Menu\ItemInterface;
use Symfony\Component\DependencyInjection\ContainerAware;
use SmartCore\Bundle\CMSBundle\Entity\Folder;

class AdminMenu extends ContainerAware
{
    /**
     * @param FactoryInterface $factory
     * @param array $options
     * @return ItemInterface
     */
    public function main(FactoryInterface $factory, array $options)
    {
        $menu = $factory->createItem('admin_main');

        $menu->setChildrenAttribute('class', isset($options['class']) ? $options['class'] : 'nav');
        $menu->addChild('Structure',     ['route' => 'cms_admin_structure']);
        $menu->addChild('Modules',       ['route' => 'cms_admin_module']);
        $menu->addChild('Files',         ['route' => 'cms_admin_files']);
        $menu->addChild('Users',         ['route' => 'cms_admin_user']);
        $menu->addChild('Appearance',    ['route' => 'cms_admin_appearance']);
        $menu->addChild('Configuration', ['route' => 'cms_admin_config']);
        $menu->addChild('Reports',       ['route' => 'cms_admin_reports']);
        $menu->addChild('Help',          ['route' => 'cms_admin_help']);

        return $menu;
    }

    public function user(FactoryInterface $factory, array $options)
    {
        $menu = $factory->createItem('admin_user');

        $menu->setExtra('select_intehitance', false);
        $menu->setChildrenAttribute('class', isset($options['class']) ? $options['class'] : 'nav nav-pills');

        $menu->addChild('All users',    ['route' => 'cms_admin_user']);
        $menu->addChild('Create user',  ['route' => 'cms_admin_user_create']);
        $menu->addChild('Roles',        ['route' => 'cms_admin_user_roles']);

        return $menu;
    }

    /**
     * Меню управления стуктурой (папки и блоки).
     *
     * @param FactoryInterface $factory
     * @param array $options
     * @return ItemInterface
     */
    public function structure(FactoryInterface $factory, array $options)
    {
        $menu = $factory->createItem('admin_structure');

        $menu->setChildrenAttribute('class', isset($options['class']) ? $options['class'] : 'nav nav-pills');
        $menu->addChild('Create folder',  ['route' => 'cms_admin_structure_folder_create']);
        $menu->addChild('Connect module', ['route' => 'cms_admin_structure_node_create']);
        $menu->addChild('Blocks',         ['route' => 'cms_admin_structure_block']);

        return $menu;
    }

    /**
     * Меню на странице редактирования папки.
     *
     * @param FactoryInterface $factory
     * @param array $options
     */
    public function structureOnFolderEdit(FactoryInterface $factory, array $options)
    {
        $menu = $this->structure($factory, $options);

        $item = $menu->addChild('Folder edit', ['uri' => '#']);
        $item->setCurrent(true);

        return $menu;
    }

    /**
     * Меню на странице редактирования ноды.
     *
     * @param FactoryInterface $factory
     * @param array $options
     */
    public function structureOnNodeEdit(FactoryInterface $factory, array $options)
    {
        $menu = $this->structure($factory, $options);

        $item = $menu->addChild('Node edit', ['uri' => '#']);
        $item->setCurrent(true);

        return $menu;
    }

    /**
     * Построение полной структуры, включая ноды.
     *
     * @param FactoryInterface  $factory
     * @param array             $options
     *
     * @return ItemInterface
     */
    public function structureTree(FactoryInterface $factory, array $options)
    {
        $menu = $factory->createItem('full_structure');
        $menu->setChildrenAttributes([
            'class' => 'filetree',
            'id'    => 'browser',
        ]);

        $this->addChild($menu);

        return $menu;
    }

    /**
     * Рекурсивное построение дерева.
     *
     * @param ItemInterface $menu
     * @param Folder        $parent_folder
     */
    protected function addChild(ItemInterface $menu, Folder $parent_folder = null)
    {
        $folders = (null == $parent_folder)
            ? $this->container->get('cms.folder')->findByParent(null)
            : $parent_folder->getChildren();

        /** @var $folder Folder */
        foreach ($folders as $folder) {
            $uri = $this->container->get('router')->generate('cms_admin_structure_folder', ['id' => $folder->getId()]);
            $menu->addChild($folder->getTitle(), ['uri' => $uri])->setAttributes([
                'class' => 'folder',
                'title' => $folder->getDescr(),
                'id'    => 'folder_id_' . $folder->getId(),
            ]);

            /** @var $sub_menu ItemInterface */
            $sub_menu = $menu[$folder->getTitle()];

            $this->addChild($sub_menu, $folder);

            /** @var $node \SmartCore\Bundle\CMSBundle\Entity\Node */
            foreach ($folder->getNodes() as $node) {
                $uri = $this->container->get('router')->generate('cms_admin_structure_node_properties', ['id' => $node->getId()]);
                $sub_menu->addChild($node->getDescr() . ' (' . $node->getModule() . ':' . $node->getId() . ')', ['uri' => $uri])->setAttributes([
                    'title' => $node->getDescr(),
                    'id'    => 'node_id_' . $node->getId(),
                ]);
            }
        }
    }
}
