function [data, auxData, metaData, txtData, weights] = mydata_Temora_longicornis 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Calanoida'; 
metaData.family     = 'Temoridae';
metaData.species    = 'Temora_longicornis'; 
metaData.species_en = 'Copepod'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.5); % K, body temp
metaData.data_0     = {'ab'; 'ap_f'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdi'; 'Ri'};
metaData.data_1     = {'t-L_f'; 'L-Wd'; 't-Wd_f'; 'JX-Ri'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author    = {'Karel Vlaeminck'};    
metaData.date_subm = [2019 04 01];              
metaData.email     = {'karel.vlaeminck@ugent.be'};            
metaData.address   = {'GhEnToxLab (UGent)'};   

metaData.author_mod_1   = {'Tan Tjui Yeuw', 'Jaap van der Meer'};    
metaData.date_mod_1     = [2023 12 05];              
metaData.email_mod_1    = {'tan.tjuiyeuw@wur.nl'};            
metaData.address_mod_1  = {'WUR Wageningen Marine Research - Yerseke - NL'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 01 01]; 

metaData.T_typical       = C2K(12.5); % K, body temp
metaData.data_0          = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wdb'; 'Wdi'; 'Ri'};
metaData.data_1          = {'tL'; 'tL-X'; 'tp-X'; 'L-Wd'; 't-Wd_f'; 'JX-Ri'; 'JX-Ri'; 'X-Ri'};

%% set data
% Zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'DamLope2003';   
  temp.ab = C2K(15.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '>90% hatching succes was observed after 48 hours. Temperature between 14 and 17 C';
data.tp = 23.7;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'BakkRijs1976';
  temp.tp = C2K(12.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Average time it takes from hatching to first copepodite stage';
data.am = 60;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SichKior2011';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.ab = 'Maximum value found for 50 percent succes rate from hatching to adult';

%data.Lj  = 0.04084;   units.Lj  = 'mm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'BakkRijs1987';
%  comment.Lj = 'Length at metamorphosis calculated as seasonal average length of the first three copepodite stages';
data.Lp  = 0.10545;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BakkRijs1987'; 
comment.Lp = 'Length at puberty calculated as seasonal average lenght of the last three copepodite stages and the adult stage';
data.Li  = 0.10545;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SichKior2011';
  comment.Li = 'Maximum length recorded in all of the data';

data.Wdb = 0.176;   units.Wdb = 'mug';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'DamLope2003';
  comment.Wdb = 'based on 88.3 ng C/egg, w_E = 23.9 g/mol: 0.0883*23.9/12 mug';
%data.Wdj = 3.1250;   units.Wdj = 'mug';   label.Wdj = 'dry weight at metam';     bibkey.Wdj = 'BakkRijs1987';
%  comment.Wdj = 'Weight at metamorphosis calculated as seasonal average weight of the first three copepodite stages';
data.Wdp = 31.8601;   units.Wdp = 'mug';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'BakkRijs1987';
  comment.Wdp = 'Weight at puberty calculated as seasonal average weight of last three copepodite stages and the adult stage';
data.Wdi = 31.8601;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'BakkRijs1987';
  comment.Wdi = 'Maximum weight recorded in all of the data';

data.Ri  = 51.49;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MapsRung2005';   
temp.Ri = C2K(18);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.del_Lip = 1; units.del_Lip = '-' ; label.del_Lip  = 'ratio between Li from abj and abp model'; bibkey.del_Lip = 'guess'                      ;
  comment.del_Lip= 'Pseudo data point used only for estimation purposes';

% uni-variate data

% time-length
data.tL_Klei1999 = [ ...  % time (days), length (mum)
        4 	     215.4175
        6 	     255.2184615
        8 	     301.8176923
        9 	     324
        11	     363.324
        13	     385.4972727
        15	     460.8191667
        16	     539.0534615
        18	     636.7178571
        20	     764.0372727];
data.tL_Klei1999(:,2) = data.tL_Klei1999(:,2)/ 10000  ;  % convert mum to cm
units.tL_Klei1999 = {'d', 'cm'}; label.tL_Klei1999 = {'time since birth', 'length', 'Klei1999'};  
temp.tL_Klei1999 = C2K(15); units.temp.tL_Klei1999 = 'K'; label.temp.tL_Klei1999 = 'temperature';
bibkey.tL_Klei1999 = 'Klei1999';
comment.tL_Klei1999 = 'Experimental data originally time-stage. Converted from mean stage-length obtained from Klei1982a';
%
data.tL_Pete1994 = [ ...  % time (days), length (mum)
        15	     255.2184615
        19	     301.8176923
        23	     363.324
        25	     385.4972727
        34	     460.8191667
        41	     539.0534615
        46	     636.7178571
        61	     764.0372727];
data.tL_Pete1994(:,2) = data.tL_Pete1994(:,2)/ 10000; % convert mum to cm
units.tL_Pete1994 = {'d', 'cm'}; label.tL_Pete1994 = {'time since birth', 'length', 'Pete1994'};  
temp.tL_Pete1994 = C2K(4); units.temp.tL_Pete1994 = 'K'; label.temp.tL_Pete1994 = 'temperature';
bibkey.tL_Pete1994 = 'Pete1994';
comment.tL_Pete1994 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a';
  
% time-length at different food concentration Klei1982b at 15 degrees Celcius
data.tLX_2080 = [ ...   % time (d), length (mum), food level 4
        2 	     172.8775
        4 	     215.4175
        5 	     255.2184615
        6 	     255.2184615
        9 	     323.9163636
        12	     363.324
        13	     385.4972727
        15	     385.4972727
        16	     460.8191667
        18	     539.0534615
        21	     636.7178571
        23	     636.7178571
        24	     764.0372727
        25	     764.0372727
        28	     764.0372727
        31	     764.0372727
        32	     764.0372727];
data.tLX_2080(:,2) = data.tLX_2080(:,2)/ 10000;  % convert mum to cm
units.tLX_2080 = {'d', 'cm'}; label.tLX_2080 = {'time since birth', 'length', '2080 mg C'};  
temp.tLX_2080 = C2K(15); units.temp.tLX_2080 = 'K'; label.temp.tLX_2080 = 'temperature';
bibkey.tLX_2080 = 'Klei1982b';
comment.tLX_2080 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana'; 
%
data.tLX_1398 = [ ...   % time (d), length (mum), food level 2
         3	     172.8775
         4	     172.8775
         5	     215.4175
         7	     301.8176923
         9	     301.8176923
         12	     363.324
         13	     385.4972727
         15	     385.4972727
         16	     460.8191667
         19	     539.0534615
         21	     636.7178571
         22	     636.7178571
         24	     764.0372727
         26	     764.0372727
         28	     764.0372727];
data.tLX_1398(:,2) = data.tLX_1398(:,2) / 10000;  % convert mum to cm
units.tLX_1398 = {'d', 'cm'}; label.tLX_1398 = {'time since birth', 'length', '1398 mg C'};  
temp.tLX_1398 = C2K(15); units.temp.tLX_1398 = 'K'; label.temp.tLX_1398 = 'temperature';
bibkey.tLX_1398 = 'Klei1982b';
comment.tLX_1398 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana'; 
%
data.tLX_0478 = [ ...  % time (d), length (mum), food level 1
         1	     172.8775
         3	     172.8775
         4	     215.4175
         5	     255.2184615
         6	     255.2184615
         8	     323.9163636
         9	     323.9163636
         11	     363.324
         12	     363.324
         13	     385.4972727
         14	     460.8191667
         16	     460.8191667
         17	     539.0534615
         19	     636.7178571
         20	     636.7178571
         22	     636.7178571
         23	     636.7178571
         24	     764.0372727
         25	     764.0372727
         27	     764.0372727
         28	     764.0372727
         29	     764.0372727
         31	     764.0372727
         32	     764.0372727
         33	     764.0372727
         35	     764.0372727
         37	     764.0372727];
data.tLX_0478(:,2) = data.tLX_0478(:,2)/ 10000;  % convert mum to cm
units.tLX_0478 = {'d', 'cm'}; label.tLX_0478 = {'time since birth', 'length','478 mg C'};  
temp.tLX_0478 = C2K(15); units.temp.tLX_0478 = 'K'; label.temp.tLX_0478 = 'temperature';
bibkey.tLX_0478 = 'Klei1982b'                    ;
comment.tLX_0478 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana'; 
%
data.tLX_0300 = [ ...  % time (d), length (mum), food level 1/2
         3	     172.8775
         4	     172.8775
         5	     255.2184615
         7	     255.2184615
         8	     301.8176923
         10	     323.9163636
         12	     323.9163636
         13	     363.324
         15	     385.4972727
         16	     385.4972727
         19	     460.8191667
         21	     636.7178571
         23	     636.7178571
         24	     636.7178571
         25	     636.7178571
         28	     636.7178571
         31	     764.0372727
         32	     764.0372727
         35	     764.0372727];
data.tLX_0300(:,2) = data.tLX_0300(:,2)/ 10000;  % convert mum to cm
units.tLX_0300 = {'d', 'cm'}; label.tLX_0300 = {'time since birth', 'length', '300 mg C'};  
temp.tLX_0300 = C2K(15); units.temp.tLX_0300 = 'K'; label.temp.tLX_0300 = 'temperature';
bibkey.tLX_0300 = 'Klei1982b';
comment.tLX_0300 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana'; 
%
data.tLX_0165 = [ ... % time (d), length (mum), food level 1/4
         0	     120.405
         2	     120.405
         3	     215.4175
         5	     215.4175
         6	     215.4175
         7	     301.8176923
         9	     301.8176923
         10	     323.9163636
         12	     363.324 
         13	     385.4972727
         14	     385.4972727
         16	     385.4972727
         17	     385.4972727
         19	     636.7178571
         20	     636.7178571
         21	     636.7178571
         23	     764.0372727
         24	     764.0372727
         27	     764.0372727];
data.tLX_0165(:,2) = data.tLX_0165(:,2)/ 10000;  % convert mum to cm
units.tLX_0165 = {'d', 'cm'}; label.tLX_0165 = {'time since birth', 'length', '163 mg C'};  
temp.tLX_0165 = C2K(15); units.temp.tLX_0165 = 'K'; label.temp.tLX_0165 = 'temperature';
bibkey.tLX_0165 = 'Klei1982b';
comment.tLX_0165 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana'; 
%
data.tLX_0092 = [ ... % time (d), length (mum), food level 1/8
         0	     120.405
         2	     172.8775
         2.01    215.4175
         3	     215.4175
         5	     215.4175
         5.01    255.2184615
         7	     301.8176923
         8	     363.324
         8.01    301.8176923
         10	     363.324
         12	     363.324
         13	     323.9163636
         13.01   323.9163636
         15	     323.9163636
         15.01   385.4972727
         17	     460.8191667
         18	     460.8191667
         20	     460.8191667
         23	     460.8191667
         24	     460.8191667
         24.01   764.0372727
         26	     764.0372727
         28	     764.0372727
         31	     764.0372727];
data.tLX_0092(:,2) = data.tLX_0092(:,2)/ 10000;  % convert mum to cm
units.tLX_0092 = {'d', 'cm'}; label.tLX_0092 = {'time since birth', 'length', '92 mg C'};  
temp.tLX_0092 = C2K(15); units.temp.tLX_0092 = 'K'; label.temp.tLX_0092 = 'temperature';
bibkey.tLX_0092 = 'Klei1982b';
comment.tLX_0092 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana';
%
data.tLX_0047 = [ ... % time (d), length (mum), food level 1/16
         2	     120.405
         3	     172.8775
         4	     215.4175
         6	     255.2184615
         7	     255.2184615
         9	     301.8176923
         10	     301.8176923
         11	     301.8176923
         13	     301.8176923
         16	     323.9163636
         17	     323.9163636
         18	     363.324 
         20	     363.324 
         24	     460.8191667
         25	     539.0534615
         32	     636.7178571
         34	     636.7178571
         35	     636.7178571 
         37	     636.7178571 
         39	     764.0372727
         40	     764.0372727];
data.tLX_0047(:,2) = data.tLX_0047(:,2)/ 10000;  % convert mum to cm
units.tLX_0047 = {'d', 'cm'}; label.tLX_0047 = {'time since birth', 'length', '47 mg C'};  
temp.tLX_0047 = C2K(15); units.temp.tLX_0047 = 'K'; label.temp.tLX_0047 = 'temperature';
bibkey.tLX_0047 = 'Klei1982b';
comment.tLX_0047 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana';
%
data.tLX_0029 = [ ... % time (days), length (mum), food level 0
         3	     172.8775
         6	     172.8775
         10	     323.9163636
         13	     363.324
         17	     363.324 
         20	     385.4972727
         24	     385.4972727
         27	     460.8191667
         31	     539.0534615
         34	     636.7178571
         38	     636.7178571
         41	     764.0372727];
data.tLX_0029(:,2) = data.tLX_0029(:,2)/ 10000;  % convert mum to cm
units.tLX_0029 = {'d', 'cm'}; label.tLX_0029 = {'time since birth', 'length', '29 mg C'};  
temp.tLX_0029 = C2K(15); units.temp.tLX_0029 = 'K'; label.temp.tLX_0029 = 'temperature';
bibkey.tLX_0029 = 'Klei1982b';
comment.tLX_0029 = 'Data originally time-stage. Converted from mean stage-length obtained from Klei1982a; food species were Oxyrrhis marina, Rhodomonas sp., Isochrysis galbana'; 

% food concentration - time since birth at puberty at different temperatures
data.Xtp_05C = [ ... % food concentration (mg C/m^3), time since birth at puberty (d)
         109	     100
         149         79
         343	     56
         895	     62];
units.Xtp_05C = {'mg C/m^3', 'd'}; label.Xtp_05C = {'food concentration', 'time at puberty', '5 C'};  
temp.Xtp_05C = C2K(5); units.temp.Xtp_05C = 'K'; label.temp.Xtp_05C = 'temperature';
bibkey.Xtp_05C = 'Dzie2011';
comment.Xtp_05C = 'food species were Rhodomonas sp., Isochrysis galbana, traces of Oxyrrhis marina';
% 
data.Xtp_10C = [ ... % food concentration (mg C/m^3), time since birth at puberty (d)
         53	     70
         124	 43
         206	 30
         760	 24];
units.Xtp_10C = {'mg C/m^3', 'd'}; label.Xtp_10C = {'food concentration', 'time at puberty', '10 C'};  
temp.Xtp_10C = C2K(10); units.temp.Xtp_10C = 'K'; label.temp.Xtp_10C = 'temperature'                  ;
bibkey.Xtp_10C = 'Dzie2011';
comment.Xtp_10C = 'food species were Rhodomonas sp., Isochrysis galbana, traces of Oxyrrhis marina';
%
data.Xtp_15C =  [ ... % food concentration (mg C/m^3), time since birth at puberty (d)
         61	     47
         88	     28
         157	 21
         461	 17];
units.Xtp_15C = {'mg C/m^3', 'd'}; label.Xtp_15C = {'food concentration', 'time at puberty', '15 C'};  
temp.Xtp_15C = C2K(15); units.temp.Xtp_15C = 'K'; label.temp.Xtp_15C = 'temperature'                  ;
bibkey.Xtp_15C = 'Dzie2011';
comment.Xtp_15C = 'food species were Rhodomonas sp., Isochrysis galbana, traces of Oxyrrhis marina';
%
data.Xtp_20C = [ ... % food concentration (mg C/m^3), time since birth at puberty (d)
         45	     31
         72	     26
         141	 19
         358	 14];
units.Xtp_20C = {'mg C/m^3', 'd'}; label.Xtp_20C = {'food concentration', 'time at puberty', '20 C'};  
temp.Xtp_20C = C2K(20); units.temp.Xtp_20C = 'K'; label.temp.Xtp_20C = 'temperature';  
bibkey.Xtp_20C = 'Dzie2011';
comment.Xtp_20C = 'food species were Rhodomonas sp., Isochrysis galbana, traces of Oxyrrhis marina';   

% time-dry weight
data.tW1 = [ ... % time (d), ash-free dry weight (mug)
         12	     1.01435115
         13		 1.359571096
         15		 4.217425267
         16		 8.732969275
         17		 5.442270787
         18		 6.87353852
         19		 7.473390187
         20		 14.20477836
         21		 11.02966079
         22		 21.72536013
         23		 32.303881
         23.01	 24.25610179
         23.02	 17.57783872
         28		 19.45866145
         28.01	 26.66797424
         29		 40.98022907
         38		 32.96535248
         38.01   25.10611566
         38.02	 19.96026858];
units.tW1 = {'d', 'mug'}; label.tW1 = {'time since birth', 'total weight', '200 mug/L'};  
temp.tW1 = C2K(12.5); units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'HarrPaff1976';
comment.tW1 = 'Population from the Island of Sylt in the Southeastern North Sea, at 200 mug/L food density';
%
data.tW2 = [ ... % time (d), ash-free dry weight (mug)
         11	     0.850889972
         11.01	 0.914214315
         11.02	 0.966952747
         14	     0.869107617
         14.01	 1.791986877
         15	     1.107083341
         15.01	 2.449925509
         16	     2.224619756
         16.01	 2.986740261
         16.02	 3.837752291
         17	     4.052342124
         17.01	 3.289733628
         17.02	 5.024554528
         17.03   6.225268429
         18      2.003477827
         18.01	 5.905504267
         19	     5.06607626
         19.01	 9.124815991
         20	     3.269739914
         20.01  10.34735448
         21      3.788934836
         21.01   7.058251133
         21.02  13.27942608
         21.03  16.57360008
         23	     8.65743438
         23.01  12.39356019
         23.02  14.72049742
         23.03  15.68877831
         24	    16.81017953
         24.01  15.51756526
         24.02  22.70709326
         25	    14.01767846
         25.01  22.65524283
         25.02  20.78924
         27	    21.71873908
         30	    17.39926371
         30.01  34.59707339
         30.02	52.04240746
         32	    22.58285109
         32.01  37.83483101];
units.tW2 = {'d', 'mug'}; label.tW2 = {'time since birth', 'total weight', '100 mug/L'};  
temp.tW2 = C2K(12.5); units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'HarrPaff1976';
comment.tW2 = 'Population from the Island of Sylt in the Southeastern North Sea, at 100 mug/L food density';
%
data.tW3 = [ ... % time (d), ash-free dry weight (mug)
         13	     0.805954323
         13.01   0.858706388
         14		 1.093834087
         14.01	 1.96387524
         17		 3.024761047
         18		 3.038622264
         18.01	 4.8300857
         19		 7.955267601
         20		 4.984132652
         21		 7.272269772
         21.01	 8.326165626
         22		 9.811370319
         25		18.77980708
         26		16.01491082
         29		23.05932261
         30		26.02951723
         30.01	32.73006603
         32		35.17660075
         32.01	24.94592564
         32.02	18.59468808];
units.tW3 = {'d', 'mug'}; label.tW3 = {'time since birth', 'total weight', '50 mug/L'};  
temp.tW3 = C2K(12.5); units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'HarrPaff1976';
comment.tW3 = 'Population from the Island of Sylt in the Southeastern North Sea, at 50 mug/L food density';
%
data.tW4 = [ ... % time (d), ash-free dry weight (mug)
         17	     0.807798888
         19	     1.395468682
         21	     2.059513262
         23	     3.685845133
         26	     5.717749214
         27	     8.499246871
         30	     9.664447752
         33	    10.10886839
         37	    10.50786124
         37.01	11.28298962
         37.02	12.92796578];
units.tW4 = {'d', 'mug'}; label.tW4 = {'time since birth', 'total weight', '25 mug/L'};  
temp.tW4 = C2K(12.5); units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'HarrPaff1976';
comment.tW4 = 'Population from the Island of Sylt in the Southeastern North Sea, at 25 mug/L food density';

% length-dry weight
data.LW = [ ... % total length (mm), dry weight (mug) 
         0.416227402	     3.94609344
         0.419175354	     3.372697708
         0.420620046	     3.203458396
         0.406778337	     4.318458
         0.397516692	     2.228761799
         0.453867479	     3.462742921
         0.389652884	     2.595605616
         0.386419898	     2.725818989
         0.375545664	     1.692107559
         0.436523369	     3.388117712
         0.407410878	     2.755136036
         0.408836047	     3.694614103
         0.390441607	     2.477385579
         0.407149272	     3.416102165
         0.391776971	     3.598857777
         0.672718754	     15.94628381
         0.69092187	         12.63440946
         0.66947015	         10.310748
         0.722802702	     13.58016975
         0.632626606	     7.646513842
         0.641642263	     9.521091457
         0.615606575	     10.16873166
         0.575736988	     7.036566987
         0.604626918	     10.42382803
         0.613705049	     15.49681923
         0.580028113	     8.16470215
         0.552450119	     7.240453716
         0.526394908	     6.315253431
         0.552274413	     5.856079956
         0.546077857	     6.794606171
         0.50780524	         7.617958277
         0.95198938	         39.256191
         0.921377533	     35.06785119
         0.912111983	     38.68831601
         0.800562258	     21.85995082
         0.777525282	     18.957944
         0.824762797	     26.30490997
         0.728401859	     20.49309114
         0.76494475	         22.89023558
         0.812178361	     26.62378044
         0.773925266	     23.19387642
         0.720385772	     19.29889744
         0.65769396	         15.52118664
         0.704939284	     14.47776632
         0.662110031	     14.19278179
         0.710858615	     16.99674784];
data.LW(:,1) = data.LW(:,1)/ 10;  % convert mm to cm
units.LW = {'cm', 'mug'}; label.LW = {'total length', 'dry weight'};  
bibkey.LW = 'BakkRijs1987';
comment.LW = 'Seasonal data from the Southern North Sea: average length and average ash-free dry weight';

% ingestion rate-egg production as C
data.JXR = [ ... % ingestion rate (mug C/d), egg production (mug C/d)
         0.582959641	     0.170967742 
         0.6367713	         0.103225806
         0.744394619	     0.083870968
         0.852017937	     0.175806452
         0.923766816	     0.05483871
         1.103139013	     0.025806452
         1.30044843	         0.030645161
         1.443946188	     0.093548387
         1.695067265	     0.2
         1.497757848	     0.233870968
         2.304932735	     0.146774194
         2.286995516	     0.190322581
         2.286995516	     0.224193548
         2.627802691	     0.248387097
         2.986547085	     0.185483871
         2.64573991	         0.364516129
         2.627802691	     0.412903226
         2.896860987	     0.50483871
         2.627802691	     0.572580645
         2.878923767	     0.891935484
         3.506726457	     0.712903226
         3.650224215	     0.277419355
         4.116591928	     0.34516129
         5.013452915	     0.490322581
         5.35426009	         0.470967742
         7.524663677	     0.475806452
         7.560538117	     0.683870968
         9.372197309	     1.201612903];
units.JXR = {'mug C/d', 'mug C/d'}; label.JXR = {'ingestion rate', 'egg production rate'}; 
temp.JXR = C2K(15.5); units.temp.JXR = 'K'; label.temp.JXR = 'temperature';
bibkey.JXR = 'DamLope2003';
comment.JXR = 'Population from Long Island Sound (USA)';

% food density-egg production
data.XR_02C = [ ... % food density (mug C/L), egg production (#/d)
         39.56	     0
         65.93	     12
         65.93	     0
         87.91	     0
         105.49	     0
         162.64	     0
         101.10	     6
         109.89	     9
         175.82	     4
         210.99	     6
         215.38	     5
         232.97	     4
         378.02	     1
         461.54	     5];
units.XR_02C = {'mug C/L', '#/d'}; label.XR_02C = {'food density', 'egg production', '2 C'}; 
temp.XR_02C = C2K(2); units.temp.XR_02C = 'K'; label.temp.XR_02C = 'temperature';
bibkey.XR_02C = 'MapsRung2005';
comment.XR_02C = 'Population in the Gulf of St. Lawrence (CA), food species were  Oxyrrhis marina, some Isochrysis galbana'; 
% 
data.XR_06C = [ ... % food density (mug C/L), egg production (#/d)
         39.24	     7
         63.41	     8
         72.22	     7
         65.68	     6
         105.09      9
         47.66	     16
         91.48	     19
         91.36	     22
         131.16      16
         146.57      16
         161.90      17
         173.08      12
         139.44      28
         192.13      29
         299.92      27
         296.10      14];
units.XR_06C = {'mug C/L', '#/d'}; label.XR_06C = {'food density' ,'egg production', '6 C'}; 
temp.XR_06C = C2K(6); units.temp.XR_06C = 'K'; label.temp.XR_06C = 'temperature';
bibkey.XR_06C = 'MapsRung2005';
comment.XR_06C = 'Population in the Gulf of St. Lawrence (CA), food species were  Oxyrrhis marina, some Isochrysis galbana'; 
%
data.XR_10C = [ ... % food density (mug C/L), egg production (#/d)
         72.57	     1
         55.14	     5
         83.81	     7
         79.92	     18
         141.41	     17
         115.27	     23
         97.90	     27
         181.48	     29
         164.20	     36
         278.87	     45
         307.68	     50
         295.68	     27
         317.80	     30
         388.18	     31
         460.53	     27];
units.XR_10C = {'mug C/L', '#/d'}; label.XR_10C = {'food density' ,'egg production', '10 C'}; 
temp.XR_10C = C2K(10); units.temp.XR_10C = 'K'; label.temp.XR_10C = 'temperature';
bibkey.XR_10C = 'MapsRung2005';
comment.XR_10C = 'Population in the Gulf of St. Lawrence (CA), food species were  Oxyrrhis marina, some Isochrysis galbana';
% 
data.XR_14C = [ ... % food density (mug C/L), egg production (#/d)
         116.54	     8
         103.47	     5
         76.68	     12
         63.38	     13
         76.51	     16
         153.98	     10
         226.77	     10
         257.43	     15
         226.21	     23
         243.62	     28
         174.87	     36
         300.96	     28
         340.36	     35
         397.45	     41];
units.XR_14C = {'mug C/L', '#/d'}; label.XR_14C = {'food density', 'egg production', '14 C'}; 
temp.XR_14C = C2K(14); units.temp.XR_14C = 'K'; label.temp.XR_14C = 'temperature';
bibkey.XR_14C = 'MapsRung2005';
comment.XR_14C = 'Population in the Gulf of St. Lawrence (CA), food species were  Oxyrrhis marina, some Isochrysis galbana'; 
% 
data.XR_18C = [ ... % food density (mug C/L), egg production (#/d)
         103.22	     2
         98.82	     2
         228.57	     0
         210.98	     0
         155.98	     2
         237.25	     3
         166.71	     8
         377.00	     23
         295.43	     29
         323.90	     31
         319.42	     33
         371.86	     40
         352.21	     37
         483.79	     44
         551.56	     52];
units.XR_18C = {'mug C/L', '#/d'}; label.XR_18C = {'food density', 'egg production', '18 C'}; 
temp.XR_18C = C2K(18); units.temp.XR_18C = 'K'; label.temp.XR_18C = 'temperature';
bibkey.XR_18C = 'MapsRung2005';
comment.XR_18C = 'Population in the Gulf of St. Lawrence (CA), ignorned due to diverging result interpretations; , food species were  Oxyrrhis marina, some Isochrysis galbana';

%% set weights for all real data
weights = setweights(data, []);
weights.del_Lip = 5 * weights.del_Lip;
weights.XR_18C = 0 * weights.XR_18C;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3','tW4'}; subtitle1 = {'Food density 200, 100, 50, 25 25 mug/L'}; label1 = {'Food density'};
set2 = {'tL_Klei1999','tL_Pete1994'}; subtitle2 = {'Data from Klei1999, Pete1994'}; label2 = {'Data source'};
set3 = {'tLX_2080','tLX_1398','tLX_0478','tLX_0300'}; subtitle3 = {'Food concentration 2080, 1398, 478 and 300'}; label3 = {'Food density'};
set4 = {'tLX_0165','tLX_0092','tLX_0047','tLX_0029'}; subtitle4 = {'Food concentration 165, 92, 47 and 29'}; label4 = {'Food density'};
set5 = {'Xtp_20C','Xtp_15C','Xtp_10C','Xtp_05C'}; subtitle5 = {'Temperature 20, 15, 10, 5 C'}; label5 = {'Temperature'};
set6 = {'XR_06C','XR_02C'}; subtitle6 = {'Temperatures 6, 2 C'}; label6 = {'Temperature'};
set7 = {'XR_18C','XR_14C','XR_10C'}; subtitle7 = {'Temperature 18, 14, 10 C'}; label7 = {'Temperature'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7};
txtData.label.sets = {label1,label2,label3,label4,label5,label6,label7};

%% Discussion points
D1 = '5 parameter specification of TC';   
D2 = 'JXR data could only be captured by assuming that only part of the food actually reaches the animals and a background assimilation of 1.9 J/d';   
D3 = 'XR_14C and XR_18C experiment possibly affected by limited food due to higher grazing rates'; 
D4 = 'model abp is applied, but L_p should not differ too much from L_i of abj model';
D5 = 'mod_1: data Lb, Lj and Wdj were ignored and replaced by D4; Wdb was modified; many new data sets are added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'sexual reproduction in last copepodite stage; 11 moults: 5 naupliar stages, 6 copepodite stages';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts     = struct('F1',F1);

%% Links
metaData.links.id_CoL   = '7C33G';               % Cat of Life
metaData.links.id_ITIS  = '85877';               % ITIS
metaData.links.id_EoL   = '46534191';            % Ency of Life
metaData.links.id_Wiki  = 'Temora_longicornis';  % Wikipedia
metaData.links.id_ADW   = 'Temora_longicornis';  % ADW
metaData.links.id_Taxo  = '71029';               % Taxonomicon
metaData.links.id_WoRMS = '104878';              % WoRMS

%% References
bibkey = 'BakkRijs1976'; type = 'Article'; bib = [ ... 
'author = {Bakker, C. and Van Rijswijk, P.}, ' ... 
'year = {1976}, ' ...
'title = {Feeding, growth and reproduction of the marine planktonic copepod \emph{Temora longicornis} {M}\"{u}ller}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {56}, ' ...
'pages = {675-690}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BakkRijs1987'; type = 'Article'; bib = [ ... 
'author = {Bakker, C. and Rijswijk, P. van}, ' ... 
'year = {1987}, ' ...
'title = {Development time and growth rate of the marina calanoid copepod \emph{Temora longicornis} as related to food conditions in the {O}osterschelde estuary ({S}outhern {N}orth {S}ea)}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...
'volume = {21}, ' ...
'number = {2}, '...
'doi = {}, '...
'pages = {125-144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DamLope2003'; type = 'Article'; bib = [ ... 
'author = {Dam, H. G. and Lopes, R. M.}, ' ... 
'year = {2003}, ' ...
'title = {Omnivory in the calanoid copepod \emph{Temora longicornis}: feeding, egg production and egg hatching rates}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {292}, ' ...
'pages = {119-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dzie2011'; type = 'Article'; bib = [ ... 
'author = {Dzierzbicka-G{\l}owacka, Lidia and Lemieszek, Anna and {\.Z}mijewska, Iwona Maria}, ' ... 
'year = {2011}, ' ...
'title = {Development and growth of Temora longicornis: numerical simulations using laboratory culture data}, ' ...
'journal = {Oceanologia}, ' ...
'volume = {53}, '  ...
'pages = {137-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HarrPaff1976'; type = 'Article'; bib = [ ... 
'author = {R.P. Harris and G-A. Paffenh\"{o}fer}, ' ... 
'year = {1976}, ' ...
'title = {Feeding, growth and reproduction of the marine planktonic copepod \emph{Temora longicornis} {M}\"{u}ller}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {56}, ' ...
'pages = {675-690}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% %
% bibkey = 'JonaViss2009'; type = 'Article'; bib = [ ... 
% 'author = {Jonasdottir, S. H. and Visser, A. W. and Jespersen, C.}, ' ... 
% 'year = {2009}, ' ...
% 'title = {Assessing the role of food quality in the production and hatching of \emph{Temora longicornis} eggs}, ' ...
% 'journal = {Netherlands Journal of Sea Research}, ' ...
% 'volume = {382}, ' ...
% 'doi = {10.3354/meps07985}, '...
% 'pages = {139-150}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Klei1982a'; type = 'Article'; bib = [ ... 
'author = {Klein Breteler, W.C.M. and Gonzalez, S.R.}, ' ... 
'year = {1982}, ' ...
'title = {Influence of cultivation and food concentration on body length of calanoid copepods}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {71}, ' ...
'pages = {157-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Klei1982b'; type = 'Article'; bib = [ ...                                                            ... 
'author = {Klein Breteler, W.C.M.  and Fransz, H.G. and Gonzalez, S.R.}, ' ... 
'year = {1982}, ' ... 
'title = {Growth and development of four calanoid copepod species under experimental and natural conditions}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...    
'volume = {16}, ' ...
'pages = {195-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Klei1999'; type = 'Article'; bib = [ ... 
'author = {Klein Breteler, W.C.M. and Schogt, N. and Baas, M. and Schouten, S. and Kraay, G.W.}, ' ... 
'year = {1999}, ' ...
'title = {Trophic upgrading of food quality by protozoans enhancing copepod growth: role of essential lipids}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {135}, ' ...
'pages = {191-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MapsRung2005'; type = 'Article'; bib = [ ... 
'author = {Maps, F. and Runge, J. A. and Zakardjian, B. and Joly, P.}, ' ... 
'year = {2005}, ' ...
'title = {Egg production and hatching success of \emph{Temora longicornis} ({C}opepoda, {C}alanoida) in the southern {G}ulf of {S}t. {L}awrence}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {285}, ' ...
'pages = {117-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pete1994'; type = 'Article'; bib = [ ... 
'author = {Peterson, William T. and Kimmerer, William J.}, ' ... 
'year = {1994}, ' ...
'title = {Processes controlling recruitment of the marine calanoid copepod Temora longicornis in Long Island Sound: egg production, egg mortality, and cohort survival rates}, ' ...
'journal = {Limnology and Oceanography}, ' ...
'volume = {39}, ' ...
'pages = {1594-1605}']  ;
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SichKior2011'; type = 'Article'; bib = [ ... 
'author = {Sichlau, M. H. and Kiorboe, T.}, ' ... 
'year = {2011}, ' ...
'title = {Age- and size-dependent mating performance and fertility in a pelagic copepod, \emph{Temora longicornis}}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {442}, ' ...
'doi = {10.3354/meps09402}, '...
'pages = {123-132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TiteKior2003'; type = 'Article'; bib = [ ... 
'author = {Titelman, J. and Kiorboe, T.}, ' ... 
'year = {2003}, ' ...
'title = {Motility of copepod nauplii and implications for food encounter}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {247}, ' ...
'pages = {123-135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Temora_longicornis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

