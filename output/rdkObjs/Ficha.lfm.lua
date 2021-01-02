require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmIVelen()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("com.InimigoVelen");
    obj:setTitle("Velen 4 Inimigos");
    obj:setName("frmIVelen");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.URLIMG = GUI.fromHandle(_obj_newObject("image"));
    obj.URLIMG:setParent(obj.scrollBox1);
    obj.URLIMG:setName("URLIMG");
    obj.URLIMG:setLeft(185);
    obj.URLIMG:setTop(-25);
    obj.URLIMG:setWidth(140);
    obj.URLIMG:setHeight(190);
    obj.URLIMG:setEditable(true);
    obj.URLIMG:setStyle("autoFit");
    obj.URLIMG:setField("imgInimigo");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(110);
    obj.image1:setTop(-70);
    obj.image1:setWidth(100);
    obj.image1:setHeight(100);
    obj.image1:setSRC("/imagens/2.png");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(300);
    obj.image2:setTop(-70);
    obj.image2:setWidth(100);
    obj.image2:setHeight(100);
    obj.image2:setSRC("/imagens/2.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(5);
    obj.image3:setTop(-70);
    obj.image3:setWidth(500);
    obj.image3:setHeight(800);
    obj.image3:setSRC("/imagens/1.png");
    obj.image3:setName("image3");

    obj.BarraHP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraHP:setParent(obj.scrollBox1);
    obj.BarraHP:setName("BarraHP");
    obj.BarraHP:setLeft(75);
    obj.BarraHP:setTop(160);
    obj.BarraHP:setWidth(120);
    obj.BarraHP:setHeight(20);
    obj.BarraHP:setColor("red");
    obj.BarraHP:setPosition(50);
    obj.BarraHP:setMax(100);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(75);
    obj.edit1:setTop(160);
    obj.edit1:setWidth(60);
    obj.edit1:setHeight(20);
    obj.edit1:setTransparent(true);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setField("HPAtual");
    obj.edit1:setName("edit1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(60);
    obj.label1:setTop(190);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setFontSize(12);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("HP Retirado");
    obj.label1:setName("label1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(150);
    obj.edit2:setTop(190);
    obj.edit2:setWidth(45);
    obj.edit2:setHeight(20);
    obj.edit2:setTransparent(false);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("HPRetirado");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(135);
    obj.edit3:setTop(160);
    obj.edit3:setWidth(60);
    obj.edit3:setHeight(20);
    obj.edit3:setTransparent(true);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setField("HPTotal");
    obj.edit3:setName("edit3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(407);
    obj.button1:setTop(42);
    obj.button1:setWidth(65);
    obj.button1:setHeight(65);
    obj.button1:setOpacity(0);
    obj.button1:setFontSize(12);
    obj.button1:setFontColor("#00FFFF");
    obj.button1:setName("button1");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(35);
    obj.edit4:setTop(48);
    obj.edit4:setWidth(65);
    obj.edit4:setHeight(40);
    obj.edit4:setFontSize(24);
    obj.edit4:setTransparent(true);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("blue");
    obj.edit4:setType("number");
    obj.edit4:setDecimalPlaces(0);
    obj.edit4:setMax(30);
    obj.edit4:setMin(1);
    obj.edit4:setField("level");
    obj.edit4:setName("edit4");

    obj.BarraMP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraMP:setParent(obj.scrollBox1);
    obj.BarraMP:setName("BarraMP");
    obj.BarraMP:setLeft(315);
    obj.BarraMP:setTop(160);
    obj.BarraMP:setWidth(120);
    obj.BarraMP:setHeight(20);
    obj.BarraMP:setColor("cyan");
    obj.BarraMP:setPosition(50);
    obj.BarraMP:setMax(100);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(315);
    obj.edit5:setTop(160);
    obj.edit5:setWidth(60);
    obj.edit5:setHeight(20);
    obj.edit5:setTransparent(true);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setField("MPAtual");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(375);
    obj.edit6:setTop(160);
    obj.edit6:setWidth(60);
    obj.edit6:setHeight(20);
    obj.edit6:setTransparent(true);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setField("MPTotal");
    obj.edit6:setName("edit6");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(300);
    obj.label2:setTop(190);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setFontSize(12);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("MP Retirado");
    obj.label2:setName("label2");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(390);
    obj.edit7:setTop(190);
    obj.edit7:setWidth(45);
    obj.edit7:setHeight(20);
    obj.edit7:setTransparent(false);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setField("MPRetirado");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(145);
    obj.edit8:setTop(215);
    obj.edit8:setWidth(130);
    obj.edit8:setHeight(20);
    obj.edit8:setTransparent(false);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setField("Nome");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(180);
    obj.edit9:setTop(237);
    obj.edit9:setWidth(95);
    obj.edit9:setHeight(20);
    obj.edit9:setTransparent(false);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setDecimalPlaces(0);
    obj.edit9:setType("number");
    obj.edit9:setField("Dano");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(180);
    obj.edit10:setTop(263);
    obj.edit10:setWidth(95);
    obj.edit10:setHeight(20);
    obj.edit10:setTransparent(false);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setDecimalPlaces(0);
    obj.edit10:setType("number");
    obj.edit10:setField("DanoMagico");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(180);
    obj.edit11:setTop(289);
    obj.edit11:setWidth(35);
    obj.edit11:setHeight(20);
    obj.edit11:setTransparent(false);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setField("Defesa");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(180);
    obj.edit12:setTop(314);
    obj.edit12:setWidth(35);
    obj.edit12:setHeight(20);
    obj.edit12:setTransparent(false);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setField("Resistencia");
    obj.edit12:setName("edit12");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(240);
    obj.rectangle1:setTop(289);
    obj.rectangle1:setWidth(35);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("blue");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(240);
    obj.edit13:setTop(289);
    obj.edit13:setWidth(35);
    obj.edit13:setHeight(20);
    obj.edit13:setTransparent(true);
    obj.edit13:setCanFocus(false);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("DefesaPorCent");
    obj.edit13:setName("edit13");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(240);
    obj.rectangle2:setTop(314);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setColor("blue");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(240);
    obj.edit14:setTop(314);
    obj.edit14:setWidth(35);
    obj.edit14:setHeight(20);
    obj.edit14:setTransparent(true);
    obj.edit14:setCanFocus(false);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("ResistenciaPorCent");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(360);
    obj.edit15:setTop(263);
    obj.edit15:setWidth(60);
    obj.edit15:setHeight(20);
    obj.edit15:setTransparent(false);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setField("Acerto");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(360);
    obj.edit16:setTop(289);
    obj.edit16:setWidth(60);
    obj.edit16:setHeight(20);
    obj.edit16:setTransparent(false);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setField("Esquiva");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.scrollBox1);
    obj.edit17:setLeft(360);
    obj.edit17:setTop(314);
    obj.edit17:setWidth(60);
    obj.edit17:setHeight(20);
    obj.edit17:setTransparent(false);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setField("Critical");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.scrollBox1);
    obj.edit18:setLeft(220);
    obj.edit18:setTop(363);
    obj.edit18:setWidth(60);
    obj.edit18:setHeight(20);
    obj.edit18:setTransparent(false);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("AcertoMagico");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.scrollBox1);
    obj.edit19:setLeft(220);
    obj.edit19:setTop(388);
    obj.edit19:setWidth(60);
    obj.edit19:setHeight(20);
    obj.edit19:setTransparent(false);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("CriticalMagico");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.scrollBox1);
    obj.edit20:setLeft(220);
    obj.edit20:setTop(413);
    obj.edit20:setWidth(60);
    obj.edit20:setHeight(20);
    obj.edit20:setTransparent(false);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("Persistencia");
    obj.edit20:setName("edit20");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox1);
    obj.comboBox1:setLeft(310);
    obj.comboBox1:setTop(338);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("TipoAtaque");
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setFontColor("red");
    obj.comboBox1:setItems({'Dano Fisico', 'Dano Magico'});
    obj.comboBox1:setName("comboBox1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(310);
    obj.button2:setTop(363);
    obj.button2:setWidth(100);
    obj.button2:setHeight(20);
    obj.button2:setFontSize(12);
    obj.button2:setFontColor("red");
    obj.button2:setText("Ataque Basico");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(310);
    obj.button3:setTop(388);
    obj.button3:setWidth(100);
    obj.button3:setHeight(20);
    obj.button3:setFontSize(12);
    obj.button3:setFontColor("#00FFFF");
    obj.button3:setText("Extra");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setText("Nova Habilidade");
    obj.button4:setLeft(310);
    obj.button4:setTop(413);
    obj.button4:setWidth(100);
    obj.button4:setHeight(20);
    obj.button4:setFontSize(12);
    obj.button4:setFontColor("#00FFFF");
    obj.button4:setName("button4");

    obj.rclHabilidadeInimigo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadeInimigo:setParent(obj.scrollBox1);
    obj.rclHabilidadeInimigo:setName("rclHabilidadeInimigo");
    obj.rclHabilidadeInimigo:setLeft(60);
    obj.rclHabilidadeInimigo:setTop(450);
    obj.rclHabilidadeInimigo:setWidth(400);
    obj.rclHabilidadeInimigo:setHeight(200);
    obj.rclHabilidadeInimigo:setField("campoDosItens");
    obj.rclHabilidadeInimigo:setTemplateForm("frmHabilidadeInimigo");
    obj.rclHabilidadeInimigo:setSelectable(true);

    obj.dscHabilidadeInimigo = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dscHabilidadeInimigo:setParent(obj.scrollBox1);
    obj.dscHabilidadeInimigo:setName("dscHabilidadeInimigo");
    obj.dscHabilidadeInimigo:setTop(445);
    obj.dscHabilidadeInimigo:setLeft(200);
    obj.dscHabilidadeInimigo:setVisible(false);
    obj.dscHabilidadeInimigo:setWidth(240);
    obj.dscHabilidadeInimigo:setHeight(200);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.dscHabilidadeInimigo);
    obj.rectangle3:setHeight(200);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setColor("grey");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle3);
    obj.label3:setLeft(10);
    obj.label3:setTop(10);
    obj.label3:setWidth(70);
    obj.label3:setHeight(18);
    obj.label3:setText("Skill");
    obj.label3:setName("label3");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle3);
    obj.edit21:setLeft(40);
    obj.edit21:setTop(10);
    obj.edit21:setWidth(70);
    obj.edit21:setHeight(18);
    obj.edit21:setFontSize(10);
    obj.edit21:setField("NomeSkill");
    obj.edit21:setName("edit21");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle3);
    obj.label4:setLeft(115);
    obj.label4:setTop(10);
    obj.label4:setWidth(28);
    obj.label4:setHeight(18);
    obj.label4:setText("Tipo");
    obj.label4:setName("label4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle3);
    obj.comboBox2:setLeft(145);
    obj.comboBox2:setTop(10);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("TipoSkill");
    obj.comboBox2:setItems({'Dano', 'Dano Magico', 'Buff', 'Cura', 'Real', 'Defensiva'});
    obj.comboBox2:setName("comboBox2");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle3);
    obj.button5:setLeft(200);
    obj.button5:setTop(162);
    obj.button5:setText("X");
    obj.button5:setFontSize(18);
    obj.button5:setFontColor("red");
    obj.button5:setWidth(35);
    obj.button5:setHeight(35);
    obj.button5:setName("button5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle3);
    obj.label5:setLeft(10);
    obj.label5:setTop(150);
    obj.label5:setWidth(70);
    obj.label5:setHeight(18);
    obj.label5:setText("Foco");
    obj.label5:setName("label5");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle3);
    obj.edit22:setLeft(45);
    obj.edit22:setTop(150);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(18);
    obj.edit22:setType("number");
    obj.edit22:setField("Foco");
    obj.edit22:setName("edit22");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle3);
    obj.label6:setLeft(100);
    obj.label6:setTop(150);
    obj.label6:setWidth(70);
    obj.label6:setHeight(18);
    obj.label6:setText("Custo");
    obj.label6:setName("label6");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle3);
    obj.edit23:setLeft(140);
    obj.edit23:setTop(150);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(18);
    obj.edit23:setType("number");
    obj.edit23:setField("Custo");
    obj.edit23:setName("edit23");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle3);
    obj.label7:setLeft(10);
    obj.label7:setTop(175);
    obj.label7:setWidth(70);
    obj.label7:setHeight(18);
    obj.label7:setText("Intensidade");
    obj.label7:setName("label7");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle3);
    obj.edit24:setLeft(85);
    obj.edit24:setTop(175);
    obj.edit24:setWidth(70);
    obj.edit24:setCanFocus(false);
    obj.edit24:setType("number");
    obj.edit24:setHeight(18);
    obj.edit24:setField("Intensidade");
    obj.edit24:setName("edit24");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle3);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(40);
    obj.textEditor1:setWidth(160);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setFontSize(10);
    obj.textEditor1:setField("DescriHabilidade");
    obj.textEditor1:setName("textEditor1");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle3);
    obj.button6:setLeft(175);
    obj.button6:setTop(60);
    obj.button6:setWidth(60);
    obj.button6:setHeight(60);
    obj.button6:setFontSize(12);
    obj.button6:setFontColor("blue");
    obj.button6:setText("Usar");
    obj.button6:setName("button6");

    obj.popExtra = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExtra:setParent(obj);
    obj.popExtra:setName("popExtra");
    obj.popExtra:setWidth(500);
    obj.popExtra:setHeight(700);
    obj.popExtra:setBackOpacity(0.5);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.popExtra);
    obj.image4:setAlign("client");
    obj.image4:setSRC("/imagens/3.png");
    obj.image4:setName("image4");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.popExtra);
    obj.edit25:setLeft(230);
    obj.edit25:setTop(132);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(18);
    obj.edit25:setFontSize(12);
    obj.edit25:setField("Atletismo");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.popExtra);
    obj.edit26:setLeft(230);
    obj.edit26:setTop(156);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(18);
    obj.edit26:setFontSize(12);
    obj.edit26:setField("Sabedoria");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.popExtra);
    obj.edit27:setLeft(230);
    obj.edit27:setTop(180);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(18);
    obj.edit27:setFontSize(12);
    obj.edit27:setField("Percepcao");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.popExtra);
    obj.edit28:setLeft(230);
    obj.edit28:setTop(204);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(18);
    obj.edit28:setFontSize(12);
    obj.edit28:setField("Acrobacia");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.popExtra);
    obj.edit29:setLeft(230);
    obj.edit29:setTop(228);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(18);
    obj.edit29:setFontSize(12);
    obj.edit29:setField("Vigor");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.popExtra);
    obj.edit30:setLeft(230);
    obj.edit30:setTop(324);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(18);
    obj.edit30:setFontSize(12);
    obj.edit30:setField("Visao");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.popExtra);
    obj.edit31:setLeft(230);
    obj.edit31:setTop(346);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(18);
    obj.edit31:setFontSize(12);
    obj.edit31:setField("DistanciaA");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.popExtra);
    obj.edit32:setLeft(230);
    obj.edit32:setTop(368);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(18);
    obj.edit32:setFontSize(12);
    obj.edit32:setField("RegenMP");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.popExtra);
    obj.edit33:setLeft(230);
    obj.edit33:setTop(390);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(18);
    obj.edit33:setFontSize(12);
    obj.edit33:setField("Deslocamento");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.popExtra);
    obj.edit34:setLeft(230);
    obj.edit34:setTop(412);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(18);
    obj.edit34:setFontSize(12);
    obj.edit34:setField("Corrida");
    obj.edit34:setName("edit34");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.popExtra);
    obj.button7:setLeft(300);
    obj.button7:setTop(132);
    obj.button7:setWidth(70);
    obj.button7:setHeight(20);
    obj.button7:setFontSize(12);
    obj.button7:setFontColor("#00FFFF");
    obj.button7:setText("Atletismo");
    obj.button7:setName("button7");


				local function RolarTesteAtletismo()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Atletismo = math.floor(tonumber(sheet.Atletismo or 0));                        
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Atletismo, "[§K2]Teste de Atletismo"); 
				end; 	   
			


    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.popExtra);
    obj.button8:setLeft(300);
    obj.button8:setTop(156);
    obj.button8:setWidth(70);
    obj.button8:setHeight(20);
    obj.button8:setFontSize(12);
    obj.button8:setFontColor("#00FFFF");
    obj.button8:setText("Sabedoria");
    obj.button8:setName("button8");


				local function RolarTesteSabedoria()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Sabedoria = math.floor(tonumber(sheet.Sabedoria or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Sabedoria, "[§K2]Teste de Sabedoria"); 
				end; 	   
			


    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.popExtra);
    obj.button9:setLeft(300);
    obj.button9:setTop(180);
    obj.button9:setWidth(70);
    obj.button9:setHeight(20);
    obj.button9:setFontSize(12);
    obj.button9:setFontColor("#00FFFF");
    obj.button9:setText("Percepção");
    obj.button9:setName("button9");


				local function RolarTestePercepcao()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Percepcao = math.floor(tonumber(sheet.Percepcao or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Percepcao, "[§K2]Teste de Percepcao"); 
				end; 	   
			


    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.popExtra);
    obj.button10:setLeft(300);
    obj.button10:setTop(204);
    obj.button10:setWidth(70);
    obj.button10:setHeight(20);
    obj.button10:setFontSize(12);
    obj.button10:setFontColor("#00FFFF");
    obj.button10:setText("Acrobacia");
    obj.button10:setName("button10");


				local function RolarTesteAcrobacia()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Acrobacia = math.floor(tonumber(sheet.Acrobacia or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acrobacia, "[§K2]Teste de Acrobacia"); 
				end; 	   
			


    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.popExtra);
    obj.button11:setLeft(300);
    obj.button11:setTop(228);
    obj.button11:setWidth(70);
    obj.button11:setHeight(20);
    obj.button11:setFontSize(12);
    obj.button11:setFontColor("#00FFFF");
    obj.button11:setText("Vigor");
    obj.button11:setName("button11");


				local function RolarTesteVigor()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Vigor = math.floor(tonumber(sheet.Vigor or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Vigor, "[§K2]Teste de Vigor"); 
				end; 	   
			


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'Defesa', 'Resistencia', 'level'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'HPAtual', 'HPTotal'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'MPAtual', 'MPTotal'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("HPRetirado");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("MPRetirado");
    obj.dataLink5:setName("dataLink5");


		local function AtaqueBasico()      
			local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
			sheet.Acerto = sheet.Acerto or 0;                        
			if sheet.TipoAtaque == nil then
				showMessage("Escolha uma Base de Dano para seu Ataque Basico na lista acima");
			else				
				mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",						
					function (rolado)						
					local soDado = rolado.resultado + 1 - tonumber(sheet.Acerto);
						if soDado > tonumber(sheet.Critical) then
							if sheet.TipoAtaque == 'Dano Fisico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICO CORPO A CORPO CARAI  :awyeah: « " .. sheet.Dano * 2 .. " »");
							elseif sheet.TipoAtaque == 'Dano Magico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICO A DISTANCIA CARAI :awyeah: « " .. sheet.DanoMagico * 2 .. " »");								
							end;	
						else
							if sheet.TipoAtaque == 'Dano Fisico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico corpo a corpo « [§K4,0] " .. sheet.Dano .. " [§K9,0]»");
							elseif sheet.TipoAtaque == 'Dano Magico' then			
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. sheet.DanoMagico .. " [§K9,0]»");
							end;							
						end;							
				end); 
			end;
		end; 		   
	


					
		local function UsarHabilidade() 
		--[[ HABILIDADE DE DANO ]]--								
		local node = self.dscHabilidadeInimigo.node;
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if node.TipoSkill ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if node.TipoSkill == 'Dano' then
					node.Intensidade = (tonumber(sheet.Dano) or 0) + (tonumber(node.Foco) or 0);							
				end;			
				if node.TipoSkill == 'Dano Magico' then
					node.Intensidade = (tonumber(sheet.DanoMagico) or 0) + (tonumber(node.Foco) or 0);								
				end;
				if node.TipoSkill == 'Cura' then
					node.Intensidade = (tonumber(sheet.DanoMagico) or 0) + (tonumber(node.Foco) or 0);	
				end;
				if node.TipoSkill == 'Buff' then
					node.Intensidade = 0;	
				end;
				if node.TipoSkill == 'Real' then
					node.Intensidade = (tonumber(node.Foco) or 0);
				end;
				if node.TipoSkill == 'Defensiva' then
					node.Intensidade = 0;
				end;
				if sheet.AcertoMagico >= rolado.resultado then
					mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. node.DescriHabilidade);
					if node.TipoSkill == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (node.Intensidade * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. node.Intensidade or 0 .. "[§K8,0] »");
						end;	
					else
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (node.Intensidade * 2 or 0) .. "[§K9,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. node.Intensidade or 0 .. "[§K9,0] »");
						end;	
					end;
					local mesa = Firecast.getMesaDe(sheet); 
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(node.Custo) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");
				if node.TipoSkill == 'Buff' then
					mesaDoPersonagem.chat:enviarMensagem("[§K3,15]ERA BUFF ESSA MERDA");	
				else 	
				end;
			end;
		else
			mesaDoPersonagem.chat:enviarMensagem("[§K3,0] TUA HABILIDADE NÃO TEM TIPO NÃO O FILHA DA PUTA ? ELA É DIFERENTONA ? ESCOLHE O TIPO DA HABILIDADE,[§K4,0] ROLA DNV");
		end;
		end);					
		end; 														
	



		local function URL() 
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);	
		mesaDoPersonagem.chat:enviarMensagem("[§I" .. sheet.imgInimigo .. "]");	
		end;
	


    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            URL()
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            AtaqueBasico()
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            self.popExtra:show();
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclHabilidadeInimigo:append();
        end, obj);

    obj._e_event5 = obj.rclHabilidadeInimigo:addEventListener("onSelect",
        function (_)
            local node = self.rclHabilidadeInimigo.selectedNode; 
            					self.dscHabilidadeInimigo.node = node;                       
            					self.dscHabilidadeInimigo.visible = (node ~= nil);
        end, obj);

    obj._e_event6 = obj.rclHabilidadeInimigo:addEventListener("onEndEnumeration",
        function (_)
            if self.rclHabilidadeInimigo.selectedNode == nil and sheet ~= nil then
            					local nodes = ndb.getChildNodes(sheet.campoDosItens);	
            					if #nodes > 0 then
            						self.rclHabilidadeInimigo.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.dscHabilidadeInimigo.node);
        end, obj);

    obj._e_event8 = obj.button6:addEventListener("onClick",
        function (_)
            UsarHabilidade()
        end, obj);

    obj._e_event9 = obj.button7:addEventListener("onClick",
        function (_)
            RolarTesteAtletismo()
        end, obj);

    obj._e_event10 = obj.button8:addEventListener("onClick",
        function (_)
            RolarTesteSabedoria()
        end, obj);

    obj._e_event11 = obj.button9:addEventListener("onClick",
        function (_)
            RolarTestePercepcao()
        end, obj);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (_)
            RolarTesteAcrobacia()
        end, obj);

    obj._e_event13 = obj.button11:addEventListener("onClick",
        function (_)
            RolarTesteVigor()
        end, obj);

    obj._e_event14 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            ---------------------------------------------
            			---------------------------------------------
            			------[[Calculo de Redução Porcentado]]------
            			---------------------------------------------
            			---------------------------------------------
            			
            			if sheet.Level == 30 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /5);
            			end;	
            				
            			if sheet.level == 29 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4.5);
            			end;
            			
            			if sheet.level == 28 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4.2);
            			end;
            			
            			if sheet.level == 27 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.9);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.9);
            			end;
            			
            			if sheet.level == 26 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.8);
            			end;
            
            			if sheet.level == 25 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.6);
            			end;
            			
            			if sheet.level == 24 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.4);
            			end;
            			
            			if sheet.level == 23 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.2);
            			end;
            			
            			if sheet.level == 22 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3);
            			end;
            			
            			if sheet.level == 21 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.8);
            			end;
            			
            			if sheet.level == 20 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.5);
            			end;
            			
            			if sheet.level == 19 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.4);
            			end;
            			
            			if sheet.level == 18 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.2);
            			end;
            			
            			if sheet.level == 17 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2);
            			end;
            			
            			if sheet.level == 16 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.9);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.9);
            			end;
            			
            			if sheet.level == 15 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.8);
            			end;
            			
            			if sheet.level == 14 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.6);
            			end;
            			
            			if sheet.level == 13 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.5);
            			end;
            			
            			if sheet.level == 12 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.3);
            			end;
            			
            			if sheet.level == 11 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.2);
            			end;
            			
            			if sheet.level == 10 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.1);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.1);
            			end;
            			
            			if sheet.level == 9 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1);
            			end;
            			
            			if sheet.level == 8 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.92);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.92);
            			end;
            			
            			if sheet.level == 7 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.8);
            			end;
            			
            			if sheet.level == 6 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.7);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.7);
            			end;
            			
            			if sheet.level == 5 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.5);
            			end;
            			
            			if sheet.level == 4 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.4);
            			end;
            			
            			if sheet.level == 3 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.3);
            			end;
            			
            			if sheet.level == 2 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.2);
            			end;
            			
            			if sheet.level == 1 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.15);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.15);
            			end;
        end, obj);

    obj._e_event15 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.BarraHP.value = tonumber(sheet.HPAtual);
            			self.BarraHP.max = tonumber(sheet.HPTotal);
        end, obj);

    obj._e_event16 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.BarraMP.value = tonumber(sheet.MPAtual);
            			self.BarraMP.max = tonumber(sheet.MPTotal);
        end, obj);

    obj._e_event17 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.HPAtual = (tonumber(sheet.HPAtual) or 0) + (tonumber(sheet.HPRetirado) or 0);
            			sheet.HPRetiradoCrtZ = (tonumber(sheet.HPRetirado) or 0);
            						
            			self.BarraHP.value = tonumber(sheet.HPAtual);
            			self.BarraHP.max = tonumber(sheet.HPTotal);
        end, obj);

    obj._e_event18 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.MPAtual = (tonumber(sheet.MPAtual) or 0) + (tonumber(sheet.MPRetirado) or 0);
            			sheet.MPRetiradoCrtZ = (tonumber(sheet.MPRetirado) or 0);
            						
            			self.BarraMP.value = tonumber(sheet.MPAtual);
            			self.BarraMP.max = tonumber(sheet.MPTotal);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rclHabilidadeInimigo ~= nil then self.rclHabilidadeInimigo:destroy(); self.rclHabilidadeInimigo = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.BarraMP ~= nil then self.BarraMP:destroy(); self.BarraMP = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.URLIMG ~= nil then self.URLIMG:destroy(); self.URLIMG = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.popExtra ~= nil then self.popExtra:destroy(); self.popExtra = nil; end;
        if self.BarraHP ~= nil then self.BarraHP:destroy(); self.BarraHP = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.dscHabilidadeInimigo ~= nil then self.dscHabilidadeInimigo:destroy(); self.dscHabilidadeInimigo = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmIVelen()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmIVelen();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmIVelen = {
    newEditor = newfrmIVelen, 
    new = newfrmIVelen, 
    name = "frmIVelen", 
    dataType = "com.InimigoVelen", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Velen 4 Inimigos", 
    description=""};

frmIVelen = _frmIVelen;
Firecast.registrarForm(_frmIVelen);
Firecast.registrarDataType(_frmIVelen);

return _frmIVelen;
