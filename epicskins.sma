#include <amxmodx>

const INVENTORY_MAX = 128;

const ESkin_Size = 5;
enum ESkin {
    HUMAN,
    KNIFE,
    BAZOOKA,
    SUPER_BAZOOKA,
    PARACHUTE,
}

enum _:CSkinData {
    m_Id,
    ESkin:m_Type,
    m_SkinName[28],
    m_Model[32],
    m_ModelIndex,
}

new const g_Skins[][CSkinData];

new g_PlayerInventory[33][INVENTORY_MAX][CSkinData];
new g_PlayerSelected[33][ESkin_Size];

public plugin_init() {
    register_dictionary("zp_epic_skins.txt");

    register_plugin("Epiczone Skin Manager", "1.0", "Corey");
}

public plugin_natives() {
    
}


public menu_skins_render(id) {
    static menuId, buffer[48], lang[16];
    formatex(buffer, charsmax(buffer), "%L", id, "M_SKINS_HEADER");
    menuId = menu_create(buffer, "menu_skins_handler")

    static i;
    for (i = 0; i < ESkin_Size; i++)
    {
        formatex(lang, charsmax(lang), "M_SKINS_%d", i);
        formatex(buffer, charsmax(buffer), "%L \y[%s]", id, lang, g_Skins[g_PlayerSelected[id][i]][m_SkinName])
        menu_additem(menuId, buffer);
    }

    formatex(buffer, charsmax(buffer), "%L", id, "M_BACK");
    menu_setprop(menuId, MPROP_BACKNAME, buffer);

    formatex(buffer, charsmax(buffer), "%L", id, "M_NEXT");
    menu_setprop(menuId, MPROP_NEXTNAME, buffer);

    formatex(buffer, charsmax(buffer), "%L", id, "M_EXIT");
    menu_setprop(menuId, MPROP_EXITNAME, buffer);
}

public menu_skins_handler() {

}