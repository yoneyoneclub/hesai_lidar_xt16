# 1号機のsensor_model

## s1100-1_sensor_kit_description
TFのframe treeは下記の通りです。
```
base_link
`-- sensor_kit_base_link
    |-- velodyne_top_base_link
    `-- velodyne_rear_base_link
```
下記の相対位置・向きを実際の値に変更してください。
- sensor_kit_base_linkは、base_linkからx方向に2m、z方向に1mの位置です。変更するにはconfig/sensors_calibration.yamlを変更してください。
- velodyne_top_base_linkは、sensor_kit_base_linkからx方向に1m、z方向に1mの位置です。変更するにはconfig/sensor_kit_calibration.yamlを変更してください。
- velodyne_rear_base_linkは、sensor_kit_base_linkからx方向に-1m、z方向に1mの位置です。また、向きが180度反対です。変更するにはconfig/sensor_kit_calibration.yamlを変更してください。
- urdfのファイルは変更不要のはずです。VLP-32Cのdescriptionがないため、VLP-16としています。おそらく影響はないと思います。

## s1100-1_sensor_kit_launch
注意点は下記の通りです。とりあえず変更の必要はないはずです。
- common_sensor_launchにVLP-32Cのlaunchファイルがないため、これのlaunchディレクトリにvelodyne_VLP32C.launch.xmlを置いています。パラメータscan_phaseの意味がわからず、デフォルトの0のままにしています。
- individual_paramsのsensors_calibration.yamlを見に行ってしまうため、autoware.launch.xmlのconfig_dirの設定をコメントアウトして確認しています。
```
diff --git a/autoware_launch/launch/autoware.launch.xml b/autoware_launch/launch/autoware.launch.xml
index f702747..9937008 100644
--- a/autoware_launch/launch/autoware.launch.xml
+++ b/autoware_launch/launch/autoware.launch.xml
@@ -62,7 +62,7 @@
       <arg name="sensor_model" value="$(var sensor_model)"/>
       <arg name="vehicle_id" value="$(var vehicle_id)"/>
       <arg name="launch_vehicle_interface" value="$(var launch_vehicle_interface)"/>
-      <arg name="config_dir" value="$(find-pkg-share individual_params)/config/$(var vehicle_id)/$(var sensor_model)"/>
+      <!--<arg name="config_dir" value="$(find-pkg-share individual_params)/config/$(var vehicle_id)/$(var sensor_model)"/>-->
     </include>
   </group>
```
