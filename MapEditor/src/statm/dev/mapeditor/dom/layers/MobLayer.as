package statm.dev.mapeditor.dom.layers
{
    import statm.dev.mapeditor.dom.DomNode;
    import statm.dev.mapeditor.dom.item.ItemFactory;

    /**
     * DOM 对象：怪物层。
     *
     * @author statm
     *
     */
    public class MobLayer extends PlacementLayerBase
    {
        public function MobLayer(root:DomNode)
        {
            super(root);

            _name = "怪物";
        }

        override public function toXML():XML
        {
            var result:XML = super.toXML();

            result.setName("mobLayer");

            return result;
        }


        override public function readXML(xml:XML):void
        {
            ItemFactory.domRoot = root;
            for each (var mobXML:XML in xml.children())
            {
                this.addItem(ItemFactory.createItemFromXML(mobXML));
            }
        }
    }
}
