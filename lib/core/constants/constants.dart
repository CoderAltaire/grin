String DEVICEID = '';
//############################# BASE URL #####################
const BASE_URL = "https://v2-api.bir-qadam.uz/api/client/";

//############################# PLAYCONSOLE URL ###################################
const PLAYCONSOLE =
    "https://play.google.com/store/search?q=bir%20qadam&c=apps&hl=uz";

//############################# APPSTORE URL ####################################
const APPSTORE = "https://apps.apple.com/uz/app/bir-qadam/id6449078729";

String img =
    "https://media.istockphoto.com/id/1436794232/photo/what-is-your-story-speech-bubble-isolated-on-the-yellow-background.jpg?s=612x612&w=0&k=20&c=hAghJgGBAikKfsc8LIEC5Bw3_fcwP5YiVDhxMP2ol7c=";

String img1 =
    "https://top-barbershop.com/media/2019/04/WhatsApp-Image-2019-04-15-at-11.10.10-1.jpeg";

const ACCESS_TOKEN = 'access-token';
const REFRESH_TOKEN = 'refresh-token';
const CURRENT_USER_VERSION = 'current_user_versioin';
const EXPIRED_INDEX = 'expired_index';
const APP_LANGUAGE = 'app-lang';
const USER_ID = 'user-id';
const V_BASE_URL = 'v_base_url';
const INITIAL_ONBOARDING = 'initial-onboarding';
const ISPUSH = 'ispush';
const FONTFAMILY = 'SFPro';
const BADGECOUNT = 'badge_count';

/// Location services errors
const LOCATION_DISABLED = "Location services are disabled.";
const PERMISSION_DENIED = "Location permissions are denied.";
const PERMISSION_DENIED_FOREVER =
    "Location permissions are permanently denied, we cannot request permissions.";
class LangModel {
  final String code;
  final String title;
  final String icon;
  LangModel({
    required this.title,
    required this.code,
    required this.icon,
  });
}
enum Status { LOADING, UNKNOWN, SUCCESS, ERROR, OTHER, OTHER_LOADING }
