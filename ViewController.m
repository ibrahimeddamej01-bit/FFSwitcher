#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

    // عنوان التطبيق
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 40)];
    titleLabel.text = @"WESTz Cache Manager";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];

    // زر Aim Body
    UIButton *aimBodyBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    aimBodyBtn.frame = CGRectMake(50, 200, self.view.bounds.size.width - 100, 60);
    [aimBodyBtn setTitle:@"تفعيل Aim Body" forState:UIControlStateNormal];
    [aimBodyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [aimBodyBtn setBackgroundColor:[UIColor blueColor]];
    aimBodyBtn.layer.cornerRadius = 10;
    [aimBodyBtn addTarget:self action:@selector(applyAimBody) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aimBodyBtn];

    // زر Aim Neck
    UIButton *aimNeckBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    aimNeckBtn.frame = CGRectMake(50, 300, self.view.bounds.size.width - 100, 60);
    [aimNeckBtn setTitle:@"تفعيل Aim Neck" forState:UIControlStateNormal];
    [aimNeckBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [aimNeckBtn setBackgroundColor:[UIColor redColor]];
    aimNeckBtn.layer.cornerRadius = 10;
    [aimNeckBtn addTarget:self action:@selector(applyAimNeck) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aimNeckBtn];

    // زر استعادة الملف الأصلي
    UIButton *restoreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    restoreBtn.frame = CGRectMake(50, 400, self.view.bounds.size.width - 100, 60);
    [restoreBtn setTitle:@"استعادة الملف الأصلي" forState:UIControlStateNormal];
    [restoreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [restoreBtn setBackgroundColor:[UIColor yellowColor]];
    restoreBtn.layer.cornerRadius = 10;
    [restoreBtn addTarget:self action:@selector(restoreOriginal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restoreBtn];
}

// دالة استبدال الملفات
- (void)replaceFile:(NSString *)sourceName {
    // ⚠️ 1. هنا يجب وضع مسار لعبة Free Fire الحقيقي على جهازك (سنعدله لاحقاً)
    NSString *gamePath = @"/var/containers/Bundle/Application/XXXX-XXXX-XXXX-XXXX/FreeFire.app/cache_res.GkLlYqzsX4AtTdE55sDMRh9sJOI~3D";
    NSString *backupPath = @"/var/mobile/Documents/cache_backup.res"; // مسار النسخة الاحتياطية

    // 2. مسار الملف المعدل الموجود داخل تطبيقنا (الاسم داخل التطبيق)
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:sourceName ofType:@"res"];

    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error;

    // 3. إنشاء نسخة احتياطية من ملف اللعبة الأصلي إذا لم تكن موجودة
    if (![fm fileExistsAtPath:backupPath]) {
        [fm copyItemAtPath:gamePath toPath:backupPath error:&error];
    }

    // 4. حذف الملف الأصلي ونسخ الملف الجديد
    [fm removeItemAtPath:gamePath error:&error];
    [fm copyItemAtPath:sourcePath toPath:gamePath error:&error];

    // 5. إظهار رسالة نجاح
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"تم بنجاح ✅" message:[NSString stringWithFormat:@"تم تفعيل %@", sourceName] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"حسناً" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)applyAimBody { [self replaceFile:@"cache_aimbody"]; }
- (void)applyAimNeck { [self replaceFile:@"cache_aimneck"]; }

- (void)restoreOriginal {
    NSString *gamePath = @"/var/containers/Bundle/Application/XXXX-XXXX-XXXX-XXXX/FreeFire.app/cache_res.GkLlYqzsX4AtTdE55sDMRh9sJOI~3D"; // ⚠️ نفس المسار السابق
    NSString *backupPath = @"/var/mobile/Documents/cache_backup.res";
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error;
    
    [fm removeItemAtPath:gamePath error:&error];
    [fm copyItemAtPath:backupPath toPath:gamePath error:&error];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"تمت الاستعادة 🔄" message:@"تم إرجاع الملف الأصلي" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"حسناً" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
