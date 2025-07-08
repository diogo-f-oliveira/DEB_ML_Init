function [data, auxData, metaData, txtData, weights] = mydata_Nacella_concinna 

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Patellogastropoda'; 
metaData.family     = 'Nacellidae';
metaData.species    = 'Nacella_concinna';
metaData.species_en = 'Antarctic limpet'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wdp'; 'Wdi'};  
metaData.data_1     = {'L-Wd'; 'L-GSI';'L-JO';'T-JO';'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Charlene Guillaumot'};         
metaData.date_subm = [2019 05 20];                     
metaData.email    = {'charleneguillaumot21@gmail.com'};  
metaData.address  = {'ULB, 1050 Brussels, BELGIUM'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 05 20]; 

data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Peck2016';   
  temp.ab = C2K(0.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.ap = 4*365;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = {'Shab1976', 'Pick1980'}; 
  comment.ap = 'Shab1976: 4 years, Pick1980: 5 to 6 years';
  temp.ap = C2K(-1.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature'; % Picken : Signy Island, Shabica: Anvers Island (Gerlache)
data.am = 14*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Shab1976'; % Shabica: Anvers Island (Gerlache)
  temp.am = C2K(-1.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
%data.L0  = 221*e-4;   units.Lb  = 'cm';   label.Lb  = 'length of the egg';    bibkey.Lb  = 'Peck2016'; 
data.Lb  = 0.0228;   units.Lb  = 'cm';   label.Lb  = 'shell length at birth';    bibkey.Lb  = 'Peck2016';  
  comment.Lb = 'Aquarium experiment, length of the velliger at 236 hours (mouth appear)';
data.Lp  = 1.54;   units.Lp  = 'cm';     label.Lp  = 'shell length at puberty';  bibkey.Lp  = {'Morl2018','Pick1980'}; 
  comment.Lp=' intertidal, Rothera station; Lp  = 1.59 cm for subtidal population';
data.Li  = 5.8;   units.Li  = 'cm';     label.Li  = 'max observed shell length';    bibkey.Li  = 'Shab1976';
  comment.Li = ['max size collected and found in the literature (Shabica, intertical collection, 600 individuals); ' ...
  'intertidal individuals are on average 1.05 times bigger than subtidal ones (data Morl2018)'];

data.Ww0 = 5.8e-6 ; units.Ww0 = 'g';    label.Ww0 = 'wet weight of the egg';             bibkey.Ww0 = 'Peck2016';
  comment.Ww0 = 'based on egg diameter of 221 mum: pi/6*0.0221^3';
data.Wdp = 0.0992;   units.Wdp = 'g';    label.Wdp = 'AFDW weight at puberty';           bibkey.Wdp = 'Shab1976';
data.Wdi = 3.93;   units.Wdi = 'g';      label.Wdi = 'AFDW weight at max size';          bibkey.Wdi = 'Morl2018'; 
  comment.Wdi='[used the relationship observed in Morl2018 data to get ADFW for a 65mm shell';

%% INTERTIDAL UNIVARIATE DATA

% length-weight
data.LWd_signy_i = [... length (mm),AFDW(g) 
8	0.00333639
8	0.003399418
8	0.003413585
8	0.003434947
9	0.00493275
9	0.00570255
9	0.005790937
10	0.007413625
10	0.007345657
10	0.008241962
10	0.007079957
11	0.01070705
11	0.010810241
11	0.01161655
13	0.017721032
13	0.01928631
13	0.018749762
13	0.020882447
13	0.01832189
13	0.020775596
14	0.026465459
14	0.024580338
14	0.026187553
14	0.025171146
14	0.02695891
14	0.026887857
15	0.029855452
15	0.034556725
15	0.029936412
15	0.033181133
16	0.037668528
17	0.05021631
17	0.048675437
17	0.043707181
17	0.047719591
18	0.054838263
18	0.059289262
18	0.057433866
18	0.055797575
18	0.059805602
19	0.078742315
19	0.070614566
20	0.088144755
20	0.08735613
21	0.090450198
22	0.131635696
22	0.104721148
22	0.109014908
22	0.121470462
24	0.15401999
24	0.149677042
24	0.172141065
24	0.182275496
24	0.178832736
24	0.162570104
25	0.161438109
25	0.167795899
25	0.165649291
25	0.205518803
25	0.183621555
25	0.170518318
26	0.202166411
26	0.215076765
26	0.232569552
26	0.200200004
26	0.226585998
26	0.206830135
26	0.23638925
26	0.190651173
26	0.194414799
26	0.202826163
27	0.255777827
27	0.221980207
27	0.212670143
27	0.230935456
28	0.286338911
28	0.267878099
28	0.280670921
28	0.248942892
29	0.314776939
30	0.350335838
31	0.336181652
31	0.355169607
31	0.391015454
31	0.383041432
31	0.410273046
32	0.405705137
32	0.372033251
32	0.497753538
32	0.4725384
32	0.482467436
33	0.424887789
33	0.478524
33	0.42340476
33	0.524064916
34	0.512056763
34	0.459031258
34	0.51933073
35	0.663907793
35	0.512142479
35	0.523184907
35	0.530678484
35	0.528795087
36	0.742967911
37	0.634910232
37	0.746932581
37	0.80868957
38	0.843411035
38	0.761737504
38	0.80738723
38	0.778545574
38	0.69805643
38	0.810329518
39	0.97158735
39	0.785597521
40	1.034182874]; 
data.LWd_signy_i(:,1) = data.LWd_signy_i(:,1)/ 10; %convert mm to cm
units.LWd_signy_i = {'cm','g'}; label.LWd_signy_i = { 'shell length','AFDW'}; 
bibkey.LWd_signy_i = {'Nola1991'};
comment.LWd_signy_i = 'data from Signy Island, intertidal population';

% length-weight
data.LWd_rothera_i = [... length (mm), AFDW(g) 
16.2	0.062
16.6	0.078
19.2	0.107
19.9	0.08
20.2	0.0805
20.3	0.092
21.2	0.0985
21.3	0.1225
21.5	0.1445
22	    0.12
22.1	0.159
22.6	0.1645
22.8	0.18
23	    0.225
23.2	0.2005
24.8	0.1825
25.4	0.194
25.6	0.3155
25.7	0.231
26	    0.2655
27	    0.254
27.1	0.341
27.1	0.198
28.7	0.4045
28.8	0.351
30.2	0.396
30.5	0.5535
31.4	0.4725];
data.LWd_rothera_i(:,1) = data.LWd_rothera_i(:,1)/10; % convert mm to cm
units.LWd_rothera_i = {'cm','g'} ; label.LWd_rothera_i = {'shell length','AFDW'}; 
bibkey.LWd_rothera_i = {'Morl2018'};
comment.LWd_rothera_i = 'data from Rothera, intertidal population';

% length-GSI
data.LGSI_i = [... length (mm),GSI(-) 
15.4	0.106321839
17	    0.086309524
17.2	0
17.5	0.02
17.8	0.086842105
18.3	0.013084112
18.5	0.067901235
18.8	0.018229167
19.5	0.057199211
19.9	0.005454545
20.1	0.045454545
21.7	0.004622496
21.8	0.029239766
22.1	0.075471698
22.8	0.076124567
24.2	0.101910828
25.2	0.055257099
25.8	0.121558093
26.1	0.122311002
26.2	0.079887877
26.3	0.082881487
26.3	0.181581234
26.8	0.113666229
27.5	0.100069013
29.5	0.058679707
29.8	0.101430429
30	    0.165358194
30.7	0.252529183
33.5	0.11282235];
data.LGSI_i(:,1) = data.LGSI_i(:,1)/10; % convert mm to cm
units.LGSI_i= {'cm', 'g'}; label.LGSI_i = { 'shell length', 'GSI'}; 
temp.LGSI_i = C2K(1.05); units.temp.LGSI_i = 'K'; label.temp.LGSI_i = 'temperature'; 
bibkey.LGSI_i = {'Morl2018'};
comment.LGSI_i = 'data by Rothera Simon';

% length-O2 consumption
data.LJO_i = [... % Length (mm),O2 consumption(mumol/h) % Simon data
16.2	0.541940149
16.6	0.731356961
19.2	1.774594616
19.9	0.784168922
20.2	0.353613506
20.3	0.753711222
21.2	0.889842795
21.3	1.171773169
21.5	1.245123303
22	    1.21126613
22.1	1.587716648
22.6	1.094885539
22.8	1.296623544
23	    7.182295249
23.2	1.125979091
24.8	1.44817562
25.4	1.383195066
25.6	2.426805458
25.7	1.304431809
26	    2.602520035
27	    1.51481152
27.1	2.077623029
28.7	2.910411363
28.8	6.382582059
30.2	7.120209976
30.5	4.125297273
31.4	5.031790674
38.1	1.865292085];
data.LJO_i(:,1) = data.LJO_i(:,1)/ 10; % convert mm to cm
units.LJO_i = {'cm','mumolO2/h'}; label.LJO_i = { 'shell length','O2 consumption'}; 
temp.LJO_i = C2K(1.05); units.temp.LJO_i = 'K'; label.temp.LJO_i = 'temperature'; 
bibkey.LJO_i = {'Morl2018'};
comment.LJO_i = 'data by Rothera Simon; 3 outliers removed, intertidal population';

% temperature-O2 consumption
data.TJO_i = [... temperature (K), oxygen consumed (mul/h)
271.65	20
271.65	19.5
273.15	24
273.15	23.5
274.65	27
274.65	28
274.65	27
276.15	39
276.15	41
276.15	38.5
276.15	38
277.65	40
277.65	41
277.65	40
279.15	40
279.15	39.5
280.65	44
280.65	44.5
280.65	44.5]; 
units.TJO_i = {'K', 'mul O2/h'}; label.TJO_i = {'temperature', 'O2 consumption'};  
bibkey.TJO_i = {'Peck1989'}; % ,
comment.TJO_i = 'data from Signy Island, intertidal population';

%% SUBTIDAL UNIVARIATE DATA

% length-weight
data.LWd_signy_s = [... length (mm),AFDW(g) 
20	0.108449708
38	0.497615615
34	0.324858186
15	0.050863698
26	0.168107895
37	0.397781826
25	0.142601387
22	0.150327116
29	0.28570962
26	0.226126096
32	0.266721949
40	0.609353608
27	0.225686592
36	0.343045195
35	0.350697694
40	0.384248241
25	0.178640345
29	0.199945058
38	0.504909026
27	0.16942485
31	0.215569926
23	0.142614005
29	0.251393323
27	0.221267473
20	0.105564797
26	0.226864038
38	0.387158619
27	0.180969083
38	0.456015069
17	0.052255317
22	0.145751522
25	0.131999774
24	0.12187595
34	0.444626597
27	0.249964327
32	0.348301468
35	0.417438253
33	0.257508194
32	0.343506299
19	0.078045954
23	0.113437343
38	0.358685216
39	0.367537726
39	0.385465722
19	0.070611066
15	0.046515417
28	0.212378813
37	0.424494989
39	0.509221432
40	0.557724788
39	0.378469112
16	0.059515467
34	0.340097187
25	0.136317806
15	0.043352939
24	0.129051132
27	0.161252573
16	0.051239793
38	0.427113294
24	0.160182911
24	0.117688951
30	0.278627146
40	0.418272457
32	0.255856796
26	0.145656303
23	0.142614005
28	0.185876664
25	0.152083658
32	0.341133527
17	0.059025516
24	0.166939431
25	0.191749495
37	0.504831274
33	0.308854389
29	0.273472518
36	0.345512644
38	0.431799803
33	0.249530954
19	0.068562277
36	0.317038997
16	0.059846408
23	0.114509424
22	0.130000032
18	0.06742793
20	0.101228942
21	0.092658184
21	0.12186627
19	0.072935516
33	0.253045421
16	0.055222823
20	0.107801878
27	0.179188566
32	0.321615414
16	0.054462554
40	0.574429092
19	0.097046116
37	0.321455629
25	0.182711183
34	0.418755281
20	0.088993935
32	0.319393854
32	0.254089464
28	0.219574939
15	0.042080563
24	0.122263895
29	0.21030357
32	0.294922635
18	0.068409464
20	0.103064922
36	0.322770769
17	0.079701662
16	0.055222823
20	0.090879853
20	0.083818485
19	0.076679253
20	0.116534122
36	0.373854489
34	0.412890015
19	0.07401723
30	0.202383
25	0.204499867
35	0.359535176
25	0.170219946
24	0.164307683
15	0.055468044
40	0.663310339
16	0.06169975
31	0.270407071
37	0.338123892
24	0.129461916
24	0.141510265
25	0.145382251
26	0.190885118
18	0.077016249
16	0.063434366
24	0.127420989
34	0.378048403
33	0.384964033
26	0.209117955
27	0.176259882
25	0.165359439
34	0.383418729
30	0.270227371
37	0.346779385
38	0.586116925
18	0.068806067
35	0.449798159
32	0.347096436
15	0.044182592
25	0.145850972
18	0.059892667
33	0.34421335
39	0.576770276
18	0.091865826
17	0.055932118
16	0.065580398
25	0.180373765
22	0.119961108
26	0.22030832
38	0.563127378
31	0.230895466
30	0.253316823
31	0.313434355
30	0.297227324
28	0.173892843
35	0.40573241
23	0.16525834
19	0.101727464
16	0.05312035
24	0.124222219
39	0.46295523
37	0.375451384
40	0.49745762
20	0.100624246
17	0.054989348
20	0.105881515
40	0.648790387
33	0.338247924
21	0.101829258
37	0.340574606
35	0.359535176
36	0.388885659
19	0.083760735
18	0.069807662
19	0.105076236
32	0.35438967
30	0.25417987
36	0.306977088
17	0.07638545
32	0.298005003
18	0.063091167
35	0.287385664
31	0.267635648
16	0.057408511
24	0.164830692
31	0.295660596
32	0.228205973
40	0.440441373
27	0.157056438
40	0.578682764
21	0.108222352
20	0.095341965
19	0.083760735
20	0.107479416
40	0.446988498
16	0.052389026
20	0.092805738
32	0.25233434
33	0.314301423
37	0.473062606
27	0.214093725
34	0.297445116
40	0.576552005
26	0.217455804
33	0.324349306
39	0.512966263]; 
data.LWd_signy_s(:,1) = data.LWd_signy_s(:,1)/10; % convert mm to cm
units.LWd_signy_s = {'cm','g'}; label.LWd_signy_s = { 'shell length','AFDW'}; 
temp.LWd_signy_s = C2K(-0.5); units.temp.LWd_signy_s = 'K'; label.temp.LWd_signy_s = 'temperature'; 
bibkey.LWd_signy_s = {'Nola1991'};
comment.LWd_signy_s = 'data from Signy Island, subtidal population';

% length-weight
data.LWd_rothera_s = [... length (mm),AFDW(g) 
23.3	0.156
26	    0.144
28.2	0.087
17.5	0.052
20.9	0.106
21.5	0.087
24.5	0.1805
27.5	0.179
18.3	0.034
20.3	0.068
23.8	0.1465
26	    0.16
20.8	0.084
23	    0.096
27.8	0.2365
30.4	0.1845
22.5	0.0695
25.5	0.1625
21.1	0.074
22.5	0.1135
31.7	0.2575
33.2	0.41
22.9	0.0775
18.1	0.0515
17.1	0.023
22.3	0.1085
21.6	0.072
17.4	0.0355
19.6	0.071];
data.LWd_rothera_s(:,1) = data.LWd_rothera_s(:,1)/10; % convert mm to cm
units.LWd_rothera_s = {'cm','g'}; label.LWd_rothera_s = { 'shell length','AFDW'}; 
temp.LWd_rothera_s = C2K(0.2); units.temp.LWd_rothera_s = 'K'; label.temp.LWd_rothera_s = 'temperature'; 
bibkey.LWd_rothera_s = {'Morl2018'};
comment.LWd_rothera_s = 'data from Rotera, subtidal population';

% length-GSI
data.LGSI_s = [... length (mm),GSI(-)
24.4	0
25.5	0.024294671
22.5	0.012865497
41.2	0.111597831
41.8	0.054959054
24.4	0.460251046
31.1	0.005729167
24.2	0.002361275
24.1	0.014689266
21.9	0.00877193
17.7	0.019230769
28.3	0.032539221
18.7	0
20.1	0
18.2	0
30.1	0.023513753
21.7	0.020214031
22.5	0.005617978
25.6	0.08957795
23.1	0.032286213
24.1	0.017274472
20.3	0
18.5	0
27.7	0.048348106
30.2	0.067433351
28	    0.020673813
23.8	0.005714286
32.8	0.001945525
27.1	0.011022658
29	    0.01161103
26.8	0.009746589
34.7	0.011312217
40	    0.101146601
29.5	0.065536205
29.8	0.028771384
41	    0.106797955
30.3	0.02055094
25.7	0
39.3	0
28.3	0.054279749
26.7	0.047524752
25.5	0.012440191
32.9	0.050228311
34.7	0.039362063
32.7	0.109621993
29	    0.012465374
24.4	0
28.6	0.154061625
23.9	0.019501625
31.2	0.002368733
26.5	0.049275362
29	    0.054239401
26.4	0.027463651
36.7	0.054732775];
data.LGSI_s(:,1) = data.LGSI_s(:,1)/ 10; %convert mm to cm
units.LGSI_s = {'cm','g'}; label.LGSI_s = { 'shell length','GSI'}; 
temp.LGSI_s = C2K(0.2); units.temp.LGSI_s = 'K'; label.temp.LGSI_s = 'temperature'; 
bibkey.LGSI_s = {'Morl2018'};
comment.LGSI_s = 'experiments Simon Morley Rothera; subtidal population'; 

% length-O2 consumption
data.LJO_s = [... length (mm),O2 consumption(umolO2/h) %data Simon Rothera
17.1	0.235775394
17.4	0.386948451
17.5	0.776454491
18.1	0.544147336
18.3	0.497307474
19.6	0.62617332
20.3	0.416499571
20.8	1.517919435
20.9	1.017617313
21.1	0.405536185
21.5	0.649806488
21.6	0.631277186
22.3	0.941207116
22.5	1.463268188
22.9	0.580139317
23	    0.771092256
23.3	1.761693763
23.8	1.056194581
24.5	0.762538333
25.5	1.305896651
26	    1.884415536
27.5	1.173420253
27.8	1.615854304
28.2	0.837456408
30.4	1.642708709
31.7	1.424271132
33.2	3.696270052];
data.LJO_s(:,1) = data.LJO_s(:,1)/ 10; % convert mm to cm
units.LJO_s = {'cm','mumolO2/h'}; label.LJO_s = {'shell length','O2 consumption'}; 
temp.LJO_s = C2K(0.2); units.temp.LJO_s = 'K'; label.temp.LJO_s = 'temperature'; 
bibkey.LJO_s = {'Morl2018'};
comment.LJO_s ='experiments Simon Morley Rothera, subtital population';

% temperature-O2 consumption
data.TJO_s = [... temperature (K), oxygen consumed (ul O2/h)
271.65	20
271.65	19.5
273.15	24
273.15	23.5
274.65	27
274.65	28
274.65	27
276.15	39
276.15	41
276.15	38.5
276.15	38
277.65	40
277.65	41
277.65	40
279.15	40
279.15	39.5
280.65	44
280.65	44.5
280.65	44.5]; 
units.TJO_s = {'K','mul O2/h'}; label.TJO_s = {'temperature', 'O2 consumption'};  
bibkey.TJO_s = {'Peck1989'}; 
comment.TJO_s ='Signy Island, subtital population';

%% set weights for all real data
weights = setweights(data, []);
weights.LJO_i([14 24 25]) = 0;
weights.LGSI_i = .1 * weights.LGSI_i;
weights.LGSI_i([1 28]) = 0;
weights.Li = .1 * weights.Li;
weights.LJO_s(27) = 0;
weights.LGSI_s = .1 * weights.LGSI_s;
weights.LWd_rothera_s(3) = 0;
weights.LGSI_s([1 6 13 14 15 22 23 38 39 47 48]) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Sub-tidal and inter-tidal conditions were merged into 1 entry, after checking that parameter values did not differ that much, except for the shape coefficient';
D2 = 'This entry is discussed in GuillSuac2020';
metaData.bibkey.D1 = 'GuillSuac2020'; 
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Group plots
set1 = {'LWd_signy_i','LWd_signy_s'};     subtitle1 = {'Data from Signy intertidal, subtital populations'};
set2 = {'LWd_rothera_i','LWd_rothera_s'}; subtitle2 = {'Data from Rothera intertidal, subtital populations'};
set3 = {'LGSI_i','LGSI_s'};               subtitle3 = {'Data for intertidal, subtital populations'};
set4 = {'LJO_i','LJO_s'};                 subtitle4 = {'Data for intertidal, subtital populations'};
set5 = {'TJO_i','TJO_s'};                 subtitle5 = {'Data for intertidal, subtital populations'};
metaData.grp.sets = {set1,set2,set3,set4,set5};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Links
metaData.links.id_CoL = '45JQP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46464988'; % Ency of Life
metaData.links.id_Wiki = 'Nacella_concinna'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3970169'; % Taxonomicon
metaData.links.id_WoRMS = '197296'; % WoRMS
metaData.links.id_molluscabase = '197296'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Peck2016'; type = 'Article'; bib = [ ... 
'author = {Peck, L. S.}, ' ... 
'year = {2016}, ' ...
'title = {Very slow embryonic and larval development in the {A}ntarctic limpet \emph{Nacella polaris}}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {39}, ' ...
'number = {12}, '...
'pages = {2273-2280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shab1976'; type = 'phdthesis'; bib = [ ...
'author = {Shabica}, ' ... 
'year = {1976}, ' ...
'title = {The natural history of the {A}ntarctic limpet \emph{Patinigera polaris}}, ' ...
'school = {University of Oregon}, ' ...
'pages = {294pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pick1980'; type = 'Article'; bib = [ ...
'author = {Picken}, ' ... 
'year = {1980}, ' ...
'title = {The distribution, growth, and reproduction of the {A}ntarctic limpet \emph{Nacella (Patinigera) concinna}}}, ' ...
'journal = {Journal of experimental marine biology and ecology}, ' ...
'volume = {71}, ' ...
'number = {3}, '...
'pages = {283-287}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kim2001'; type = 'Article'; bib = [ ...
'author = {Dohong Kim}, ' ... 
'year = {2001}, ' ...
'title = {Seasonality of marine algae and grazers of an {A}ntarctic rocky intertidal, with emphasis on the role of the limpet \emph{Nacella concinna} {S}trebel ({G}astropoda: {P}atellidae)}}, ' ...
'journal = {Ber. Polarforsch. Meeresforsch.}, ' ...
'volume = {397}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Weib2008'; type = 'Article'; bib = [ ... 
'author = {Weibe, Abele}, ' ... 
'year = {2008}, ' ...
'title = {Differences in the physiological response of inter-and subtidal {A}ntarctic limpets \emph{Nacella concinna} to aerial exposure}}, ' ...
'journal = {Aquatic Biology}, ' ...
'volume = {4}, ' ...
'number = {2}, '...
'pages = {155-166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nola1991'; type = 'Article'; bib = [ ... 
'author = {Conor P. Nolan}, ' ... 
'year = {1991}, ' ...
'title = {Size, shape and shell morphology in the {A}ntarctic limpet \emph{Nacella concinna} at {S}igny {I}sland, {S}outh {O}rkney {I}slands}, ' ...
'journal = {J Moll Stud}, ' ...
'volume = {57}, ' ...
'pages = {225-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Morl2018'; type = 'Misc'; bib = [ ...
'author = {Morley, Simon}, ' ...
'note = {Experiments at Rothera}, ' ...
'year = {2018}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Peck1989'; type = 'Article'; bib = [ ... 
'author = {Peck, L. S.}, ' ... 
'year = {1989}, ' ...
'title = {Temperature and basal metabolism in two {A}ntarctic marine herbivores}}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {127}, ' ...
'number = {1}, '...
'pages = {1-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BretPerr1994'; type = 'Article'; bib = [ ... % meant as example; replace this and further bib entries
'author = {Br\^{e}thes, J.-C. and G. Ferreyra and S. de la Vega}, ' ... 
'year = {1994}, ' ...
'title = {Distribution, growth and reproduction of the limpet \emph{Nacella (Patinigera) concinna} ({S}trebel 1908) in relation to potential food availability, in {E}speranza {B}ay ({A}ntarctic {P}eninsula)}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {14}, ' ...
'number = {3}, '...
'pages = {161-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gonz2018'; type = 'Article'; bib = [ ... 
'author = {Gonzalez-Wevar et al.}, ' ... 
'year = {2018}, ' ...
'title = {Systematic revision of \emph{Nacella} ({P}atellogastropoda: {N}acellidae) based on a complete phylogeny of the genus, with the description of a new species from the southern tip of {S}outh {A}merica}, ' ...
'journal = {Zoological Journal of the Linnean Society}, ' ...
'volume = {xx}, ' ...
'number = {}, '...
'pages = {1-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuillSuac2020'; type = 'Article'; bib = [ ... 
'author = {Guillaumot, C. and Sauc\`{e}de, t. and Morley, S. A. and Augustine, S. and Danis, B. and Kooijman, S.A.L.M.}, ' ... 
'year = {2020}, ' ...
'title = {Can {D}{E}{B} models infer metabolic differences between intertidal and subtidal morphotypes of the {A}ntarctic limpet \emph{Nacella concinna} ({S}trebel, 1908)?}, ' ...
'journal = {Ecol. Mod.}, ' ...
'volume = {430}, ' ...
'note = {\url{https://www.zotero.org/groups/500643/deb_library/items/YBMBR9NK/item-details}}, '...
'pages = {109088}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

