function [data, auxData, metaData, txtData, weights] = mydata_Asellus_aquaticus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Isopoda'; 
metaData.family     = 'Asellidae';
metaData.species    = 'Asellus_aquaticus'; 
metaData.species_en = 'Common waterlouse'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww', 'L-Ww', 't-L', 't-S', 'Wd-Jo', 'L-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Jan Baas'};    
metaData.date_subm = [2013 08 05];              
metaData.email    = {'janbaa@ceh.ac.uk'};            
metaData.address  = {'CEH'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2017 02 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Andre Gergs'};    
metaData.date_mod_2     = [2019 03 15];              
metaData.email_mod_2    = {'andre.gergs@bayer.com'};            
metaData.address_mod_2  = {'Bayer AG'};

metaData.author_mod_3   = {'Andre Gergs'};    
metaData.date_mod_3     = [2020 06 24];              
metaData.email_mod_3    = {'andre.gergs@bayer.com'};            
metaData.address_mod_3  = {'Bayer AG'};

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 03 29];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];
metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 26]; 

%% set data
% zero-variate data

data.ab = 15.64;     units.ab = 'd';     label.ab = 'age at birth';                     bibkey.ab = 'RoshMaze1979';   
  temp.ab = C2K(18.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 30;     units.tp = 'd';     label.tp = 'time since birth at puberty';         bibkey.tp = 'MarcSutc1978';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 750;    units.am = 'd';     label.am = 'life span';                           bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.08;   units.Lb  = 'cm';  label.Lb  = 'total length at birth for female';   bibkey.Lb  = 'VeroPrev2009';
  comment.Lb = 'All lengths exclude antenna';
data.Lbm  = 0.08;  units.Lbm  = 'cm'; label.Lbm  = 'total length at birth for male';    bibkey.Lbm  = 'VeroPrev2009';
data.Lp  = 0.30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'Arak2001';
data.Lpm  = 0.35;  units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for male';  bibkey.Lpm  = 'Arak2001';
data.Li  = 1.0;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female';   bibkey.Li  = 'VeroPrev2009';
data.Lim  = 1.2;   units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';    bibkey.Lim  = 'VeroPrev2009';

data.Wwb = 0.0005; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';     bibkey.Wwb = 'MarcSutc1978';
  comment.Wwb = 'value reduced by 0.5 for account for adhering water';
data.Wwbm = 0.0005; units.Wwbm = 'g'; label.Wwbm = 'wet weight at birth for male';      bibkey.Wwbm = 'MarcSutc1978';
data.Wwp = 0.003;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for female';   bibkey.Wwp = 'MarcSutc1978';
  comment.Wwp = 'Read from growth curve for t_p';
data.Wwpm = 0.003; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for male';    bibkey.Wwpm = 'MarcSutc1978';
  comment.Wwpm = 'Read from growth curve for t_p';
data.Wwi = 0.045;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'Arak2001';
data.Wwim = 0.048; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';      bibkey.Wwim = 'Arak2001';

%data.Ri  = 0.48;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'MarcSutc1978'; 
%comment.Ri = 'max # of eggs: 40; max 4 broods/year (data on number of broods/year vary between 1 and 4, depending on temperature';

data.Ri  = 103.9/365*4;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'ShihHeat1987';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean # of eggs for lemgth >9mm; max 4 broods/year (data on number of broods/year vary between 1 and 4, depending on temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    7   0.0011
    14  0.0014
    26  0.0027
    33  0.0045
    39  0.0063
    49  0.0088
    62  0.0135
    69  0.0161
    76  0.0197
    83  0.0225
    90  0.0236
    97  0.0257];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MarcSutc1978';

% length-weight
data.LW = [ ... % length (mm), wet weight (mg)
1.110	0.203
1.697	0.468
1.990	0.338
1.990	0.993
2.493	0.931
2.493	1.193
2.953	0.933
2.954	1.261
2.954	1.588
2.954	1.981
3.205	1.786
3.456	1.460
3.499	2.508
3.793	3.034
3.959	1.987
3.960	2.314
3.961	4.541
3.981	2.707
3.982	3.952
4.002	3.035
4.002	3.559
4.463	3.758
4.464	4.085
4.464	5.068
4.925	4.678
4.967	4.940
4.967	5.464
4.967	5.988
4.969	8.149
5.449	5.139
5.449	5.990
5.471	7.104
5.972	5.535
5.973	5.993
5.973	7.041
5.974	8.024
5.975	9.072
5.976	10.054
6.480	12.153
6.775	15.102
6.919	12.090
6.920	12.483
6.941	12.745
6.941	13.007
6.942	14.055
6.945	18.117
6.959	8.488
6.959	9.077
6.963	15.104
6.981	10.125
6.985	15.890
7.445	15.106
7.966	11.179
7.969	16.157
7.970	17.009
7.971	18.122
7.994	21.135
8.478	25.134
8.956	19.110
8.979	23.106
9.001	24.219
10.005	22.194
10.006	23.177];
data.LW(:,1) = data.LW(:,1)/10; data.LW(:,2) = data.LW(:,2)/1e3;
units.LW  = {'cm', 'g'};  label.LW = {'length', 'wet weight'};  
bibkey.LW = 'Arak2001';

% time-survival
data.tS = [ ...      %  time (d), survival (-)
0	30
5	30
10	30
15	30
20	30
26	27
31	24
35	21
41	16
51	12
61	6
71	3
80	0
90	0
100	0 
   ];
data.tS(:,2) = data.tS(:,2)/30;
units.tS   = {'d', '-'};  label.tS = {'starvation time', 'survival'};  
temp.tS    = C2K(11);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'HervMath1997';
comment.tS = 'starvation initiated at mean body fresh weights of 15.9 mg';

% time-length
data.tL = [ ...      %  time (d), length (mm)
0.029995688	1.331835334
0.200863983	1.208022775
0.372267915	1.115170051
0.024371497	1.006757064
0.369054091	0.92941104
0.021157673	0.820998053
8.348442768	2.13807658
8.172753738	1.983250622
8.169807733	1.812971528
8.513686872	1.689185751
8.51207996	1.596306245
8.509937411	1.472466904
8.680805706	1.348654345
8.852209638	1.255801621
8.851138363	1.193881951
8.67598497	1.070015828
6.782507157	1.626998262
6.780900246	1.534118756
6.952571996	1.45674595
6.951232903	1.379346362
6.950429447	1.332906609
6.775543873	1.224520404
6.946679986	1.116187762
6.945073074	1.023308257
6.944537437	0.992348421
14.24580931	3.00586255
14.23750693	2.525985104
14.23402529	2.324746175
14.5760297	2.092600974
14.22786546	1.96870807
14.05297988	1.860321864
14.05083733	1.736482523
14.05003388	1.690042771
14.04815915	1.581683347
14.04574878	1.442364089
15.26325234	1.814069585
15.26164542	1.721190079
15.26084197	1.674750326
15.25896724	1.566390903
15.25762814	1.488991315
21.01787154	4.431059464
21.17213508	3.347492012
21.34246773	3.192719618
21.33925391	3.006960607
21.33737918	2.898601183
21.16008324	2.650895719
21.15499468	2.356777285
21.15285213	2.232937944
20.97796656	2.124551739
21.14937049	2.031699015
21.14642449	1.861419921
21.14160375	1.582781404
29.52325603	6.042283208
29.16116523	5.113434587
28.98360146	4.850249205
28.96512198	3.78213489
29.13411554	3.549962907
27.91420162	3.038938153
28.08373082	2.837726005
28.24468983	2.141156494
27.89304395	1.816024661
36.12605688	7.684172186
36.27308931	6.182646959
35.92224689	5.903954878
36.09016918	5.609863225
36.26023402	5.439610913
43.22137621	7.793629666
43.37269375	6.53978312
43.36546264	6.121825345
43.18334597	5.595481364
43.35207171	5.347829464
42.31106064	5.177389679
42.12599796	4.480766604
35.19378018	3.798578954
35.35795301	3.287768455
50.32071283	8.13528591
50.29955515	6.912372418
50.11984884	6.525347696
50.28857459	6.277695796
50.11074301	5.999030497
49.22961967	5.07010153
49.22131729	4.590224084
57.0646541	7.935091473
57.21650727	6.712204763
57.21490036	6.619325258
57.20713362	6.170407647
57.20017033	5.767929789
55.97891732	5.179505446
56.15032125	5.086652722
64.13024556	6.326278098
64.12837083	6.217918674
62.38460364	5.428175057
63.23760602	4.731712673
71.2169947	5.940378213];
n=size(data.tL,1); for i=2:n; if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time', 'length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HoefVerb2015';
comment.tL = 'data from 40 kPa oxygen treatment';
%
data.tL2 = [ ...      %  time (d), length (mm)
0.207771565	1.275127019
0.206068519	1.17958616
0.204649315	1.099968777
0.203513951	1.036274872
0.202378587	0.972580966
0.201810905	0.940734013
0.021855752	0.845249922
0.020436547	0.76563254
6.742073742	1.388805314
6.744344469	1.261417502
6.924015782	1.181856887
6.925434986	1.102239505
6.926286509	1.054469076
6.927989555	0.958928217
7.810167182	1.468763305
7.812154069	1.35729897
7.814140955	1.245834634
7.815276319	1.182140728
7.816411683	1.118446822
7.996366836	1.022962732
9.055093526	1.628395447
9.23533252	1.51698788
9.237603247	1.389600068
9.061338026	1.278078965
13.68766143	1.741335755
13.68936448	1.645794897
13.69135137	1.534330561
13.51451846	1.454656411
13.69447362	1.35917232
13.51764071	1.279498169
13.87613182	1.16814737
15.11197525	1.83733076
15.11311061	1.773636854
15.29306577	1.678152763
15.29476881	1.582611904
15.11850359	1.471090801
15.29845874	1.37560671
15.29987795	1.295989328
20.80610826	2.396469019
20.80809514	2.285004683
20.81008203	2.173540348
20.81150123	2.093922966
20.81320428	1.998382107
20.99315943	1.902898016
20.81632653	1.823223865
20.81774574	1.743606483
20.8188811	1.679912577
20.8203003	1.600295195
20.82228719	1.488830859
21.00621612	1.170418098
27.92114899	3.242684
27.92597428	2.9719849
28.10167182	3.115352956
27.93221878	2.621668417
28.11387698	2.430643467
28.11558003	2.335102608
27.93988249	2.191734552
27.94130169	2.11211717
28.12097301	2.032556555
28.12295989	1.92109222
27.94726235	1.777724163
27.95095229	1.570718969
34.68536232	3.770315915
34.87212966	3.292668389
34.69614828	3.165223809
34.87922568	2.894581477
34.7032443	2.767136896
34.70523119	2.655672561
34.88575402	2.528341517
35.0665607	2.385086997
34.89029548	2.273565894
35.07081831	2.14623485
34.53776504	2.050523687
41.98035821	4.521046805
41.81090517	4.027362266
41.82254265	3.37449973
41.82452953	3.263035395
41.82651642	3.15157106
41.65081888	3.008203003
41.48051432	2.562288893
43.08620249	2.483182425
42.91561409	2.053191791
42.73963271	1.925747211
48.56149414	5.319321052
48.92197213	5.096505918
48.75337061	4.555050949
48.75620902	4.395816185
48.58448525	4.029519457
48.58675598	3.902131645
49.83508842	3.87068207
48.7755102	3.313019784
48.95631688	3.169765264
48.78061934	3.026397207
49.85240271	2.899350004
48.78828305	2.596463342
50.03831853	2.469472907
49.86858165	1.991711845
55.86103148	5.815276319
55.69384917	5.194203968
55.69952599	4.875734438
56.77698618	4.430217706
55.71229883	4.159177997
56.62058982	3.204053249
56.98277086	2.885697255
56.81473702	2.312395334
56.82041384	1.993925804
62.80633533	6.183730238
62.64908745	5.00533621
62.65646732	4.591325821
63.90338055	4.639493628
62.66044109	4.36839715
63.93318384	2.967528597
63.75890551	2.744543158
70.82455792	6.361443047
71.0269365	5.008004314
69.60858335	4.577616304
69.78939003	4.434361784
69.79364764	4.195509636
70.87451392	3.558911186
70.88558372	2.937895603
77.7797962	6.172575289
77.97507877	5.217223468
76.73781613	4.627657461
77.99409611	4.150350544
77.81811473	4.022905963
77.66143453	2.812664983
84.7330476	6.095171866
85.98592149	5.808946666
85.65184071	4.550878488
84.76483778	4.3117425
84.610996	2.942266754
91.6800545	6.368084925
91.86511879	5.985978258
91.70134257	5.173824189
91.90230195	3.900002838];
n=size(data.tL2,1); for i=2:n; if data.tL2(i,1)<=data.tL2(i-1,1); data.tL2(i,1)=data.tL2(i-1,1)+1e-8;end;end
data.tL2(:,2) = data.tL2(:,2)/10; % convert mm to cm
units.tL2   = {'d', 'cm'};  label.tL2 = {'time', 'length'};  
temp.tL2    = C2K(14);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'HoefVerb2015';
comment.tL2 = 'data from 40 kPa oxygen treatment';

% length-fecundity
data.LN = [ ... % Length (cm), Number of offspring
0.515	33.78
0.516	32.83
0.527	53.5
0.537	35.5
0.55	32.66
0.827	75.18
0.827	79.45
0.866	82.77
0.875	69.87
0.877	76
0.886	79.2
0.886	85.78
0.888	92.61
0.888	68.58
0.905	76.66
0.908	118.98
0.912	78.56
0.917	120.5
0.921	104.42
0.993	124.2];
units.LN   = {'cm', '#'};  label.LN = {'length', 'number of offspring'};  bibkey.LN = 'ShihHeat1987';
temp.LN    = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
comment.LN = 'means from different years and source populations';


data.LN2 = [ ... % Length (mm), Number of offspring
4.181914486279514 16.522527121888956
4.032354818123803 21.885130823229105
4.123752393107848 27.496873005743467
4.152610082961071 28.564901084875558
4.155290363752393 29.90248883216337
4.0356604977664325 36.86815571155074
4.219438417358008 35.24875558391831
4.298506700701978 34.70759412890875
4.241863433312061 33.10657306955967
4.284569240587109 27.752137843012136
4.393567326100829 28.814039566049786
4.452890874282067 31.752648372686664
4.563497128270581 33.61710274409701
4.566177409061901 34.954690491384824
4.51918315252074 38.168985322271865
4.680536056158263 38.6917677089981
4.524007657945118 40.576643267389926
4.278672622846202 24.80944479897896
4.388206764518187 26.138864071474174
4.551703892788768 27.731716656030642
4.825271218889597 30.921506062539905
4.904875558391831 30.647862156987884
4.830631780472239 33.59668155711552
4.912916400765794 34.66062539885131
4.963126994256541 33.05143586470963
4.766483726866623 28.250414805360577
4.737089980855137 26.914869176770907
4.548487555839183 26.126611359285278
4.544199106573069 23.986470963624768
4.298417358008933 21.32967453733248
4.405807275047861 21.58902361199746
4.620051052967454 21.840204211869818
4.453337587747288 18.64224633056797
4.665437141033822 17.82335673261008
4.809189534141671 22.895979578813026
4.915507338864072 22.620293554562863
4.919259731971921 24.492916400765807
4.705552010210593 24.509253350351003
5.341314613911933 21.78506700701979
5.3456030631780465 23.925207402680286
5.505347798340779 23.645437141033824
5.431104020421187 26.594256541161457
5.435392469687301 28.734396936821952
5.542246330567964 28.726228462029354
5.70252712188896 28.713975749840458
5.6202425015954045 27.650031908104665
5.617562220804084 26.312444160816852
5.833950223356732 27.63369495851947
5.918379068283344 29.767708998085524
5.0352265475430755 29.032546266751766
5.142080408423739 29.024377791959168
5.143688576898532 29.82693044033185
5.252686662412253 30.888832163369514
5.307721761327376 31.687300574345883
5.228653477983408 32.228462029355455
5.231333758774729 33.56604977664327
5.390542437779196 33.01876196553924
5.1854116145500955 37.31537970644544
5.266624122527122 37.84428844926612
5.3221952776005095 38.910274409700065
5.4263688576898526 37.564518187619655
5.05506062539885 38.93069559668156
4.901212507977025 42.15315890236121
5.087670708359923 41.871346522016594
5.302986598596043 42.657562220804095
5.438698149329929 43.71742182514359
5.514550095724314 41.57115507338864
5.620331844288449 41.02795149968091
5.7004722399489465 41.02182514358647
5.835111678366304 41.546649649010845
5.915252074026802 41.540523292916404
5.9125717932354815 40.20293554562859
5.527326100829611 34.61365666879388
5.713248245054244 34.06432673899171
5.630963624760689 33.0003828972559
5.548142948308869 31.66892150606253
5.734601148691768 31.38710912571794
5.762386726228461 31.9201021059349
5.814741544352264 31.380982769623486
5.869240587109125 31.911933631142304
5.948308870453094 31.370772176132746
5.916770899808552 28.965156349712842
6.1064454371410335 30.288449266113588
6.134231014677728 30.82144224633059
6.534932992980216 30.790810465858343
6.1401276324186345 33.76413529036377
6.247517549457562 34.023484365028736
5.90345883854499 35.655137204850035
6.014065092533504 37.51959157626037
6.3068410976388 36.962093171665614
6.203739629865986 38.84288449266114
6.337306955966815 38.83267389917039
6.125207402680281 39.651563497128265
6.127351627313337 40.72163369495853
6.28977664326739 41.77945118059988
6.341595405232929 40.97281429483088
6.450593490746649 42.03471601786855
6.292456924058712 43.117038927887684
6.453809827696235 43.63982131461391
6.584160816847478 42.02450542437781
6.771155073388639 42.010210593490754
6.878008934269304 42.00204211869816
6.742297383535418 40.94218251435865
6.8464709636247605 39.59642629227824
6.553158902361199 39.886407147415454
6.658940650925335 39.343203573707726
6.603369495851946 38.27721761327378
7.171857051691129 41.97957881301852
7.518059987236757 41.41799617102744
7.679412890874283 41.940778557753674
6.830478621569878 44.94881940012763
6.645092533503509 45.76566687938737
6.754090619017231 46.82756860242501
6.622667517549457 47.90784939374602
6.731665603063178 48.96975111678366
6.216604977664327 45.263305679642635
6.813950223356732 50.03369495851947
6.899451180599873 52.70274409700064
6.944837268666241 48.685896617740916
7.265934907466496 48.92890874282068
7.348219527760051 49.99285258455649
7.429968091895342 50.78927887683472
7.553886407147416 45.96375239310786
7.7446330567964266 47.82208040842375
7.900625398851306 45.66968730057435
7.89848117421825 44.599617102744105
8.46375239310785 46.696873005743456
7.61535417996171 49.972431397574994
7.7281046585832796 52.90695596681557
7.758570516911296 54.77753669432037
7.544862795149967 54.79387364390556
7.568359923420549 53.186726228462035
7.409151244416082 53.734014039566055
7.3546522016592215 53.20306317804723
5.821263560944479 47.9691129546905
6.0622208040842365 48.21825143586471
6.198468410976388 49.545628589661774
6.33632418634333 51.67555839183153
6.151474154435227 52.75992342054882
6.31389917038928 53.817740906190174
6.449610721123165 54.87760051052968
6.157906828334396 55.970134014039566
5.6770644543714095 56.006892150606255
6.458187619655392 59.15788130185067
6.749891512444161 58.06534779834078
6.256273133375878 65.05960433950224
7.18159540523293 60.1728142948309
7.4706190172303755 57.742693044033196
7.21152520740268 61.77587747287812
7.370733886407147 61.228589661774095
7.347236758136566 62.835737077217615
7.427377153797064 62.82961072112317
7.555047862156987 59.87670708359924
7.830223356732611 63.86904913848118
7.847823867262284 59.319208679004475
7.848359923420548 59.586726228462034
8.012929164007659 61.71461391193364
8.015073388640715 62.78468410976388
8.25549457562221 62.766305041480535
8.225564773452456 61.16324186343331
8.301952776005106 59.284492661135936
8.49055520102106 60.07275047862158
8.243701340140397 56.880918953414174
8.346266751754948 54.73261008296108
8.47661774090619 53.117294192724955
8.480370134014041 54.98991703892789
8.66575622208041 54.17306955966816
8.957460114869177 53.080536056158266
8.644403318442885 56.85028717294193
6.95832801531589 68.75175494575623
6.590772176132738 71.99055520102107
6.837089980855136 74.9148691767709
7.027836630504147 76.7731971920868
7.270938098276963 78.09240587109126
7.495813656668793 70.31601786853861
7.143267389917039 81.04530950861519
7.703714103382258 80.7349074664965
8.158379068283345 80.96770899808551
8.555328653477984 79.06445437141033
8.606075303126996 77.72278238672624
8.35278876834716 71.32074026802809
8.56542437779196 70.76936821952776
8.6509253350351 73.43841735800893
8.101825143586472 92.7446075303127
8.36627951499681 91.3865985960434
8.467236758136567 88.43573707721762
8.569266113592853 86.01991065730697
8.95129546904914 90.00408423739631
];
data.LN2(:,1)=data.LN2(:,1)/10; %convert to cm
units.LN2   = {'cm', '#'};  label.LN2 = {'length', 'number of offspring'};  bibkey.LN2 = 'Daou1984';
temp.LN2    = C2K(20);  units.temp.LN2 = 'K'; label.temp.LN2 = 'temperature';

% dry weight-O2 consumption
data.WdJO = [ ... % mean dry weight (g), O2 consumption (muL/d/animal)
6.48578E-07	0.830168142
2.56532E-06	0.82510665
2.8576E-06	1.1205216
3.17066E-06	1.301004857
3.35476E-06	1.807621367
9.4654E-06	1.200921954
1.29787E-05	1.6110291
1.61292E-05	1.730225152
2.46839E-05	2.63926419
2.88148E-05	1.604037436
2.89118E-05	1.99092939
3.1261E-05	1.723944779
4.31659E-05	2.819345746
4.83259E-05	2.368613057
6.28705E-05	2.127934095
6.35912E-05	4.503775979
7.39612E-05	5.469538831
9.74336E-05	2.122257274
0.000105139	3.003945503
0.000121506	3.931193543
0.000139997	4.786765477
0.00015102	7.716619397
0.000155451	5.44632069
0.000172343	5.992579187
0.000172747	7.020326733
0.00017299	7.710581649
0.000273057	5.427590063
0.000310638	5.783082365
0.000312151	8.175401322
0.000379208	12.11286963
0.00038985	9.518834812
0.000390524	10.74458374];
units.WdJO   = {'g', 'muL/(d*animal)'};  label.WdJO = {'dry weight', 'O2 consumption', 'female'};  bibkey.WdJO = 'Daou1984';
temp.WdJO   = C2K(10);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
comment.WdJO = 'respiration measured for females, data from intermediate temperature';

% dry weight-respiration
data.WdJOm = [ ... % mean dry weight (g), O2 consumption (muL/d/animal)
4.24703E-07	0.829295521
4.48484E-07	0.603139224
5.4522E-07	1.128427669
6.3734E-07	0.38239269
6.91144E-07	1.127888789
8.28021E-07	1.520862464
1.85325E-06	0.470281124
2.58735E-06	1.408941559
3.70356E-06	1.886706701
4.29226E-06	1.886064771
4.73978E-06	2.099927381
5.23238E-06	2.419156109
7.47712E-06	0.823797179
1.66246E-05	0.854763842
1.9112E-05	1.879016505
2.18915E-05	3.52451987
2.3613E-05	2.326571262
2.57037E-05	2.771114279
2.57772E-05	3.291400151
2.58655E-05	4.030764069
4.02485E-05	4.910815554
8.17531E-05	3.170553323
8.79842E-05	3.39380299
0.000113751	5.578160111
0.000117643	5.059089293
0.000117989	6.143441759
0.000131252	6.976087985
0.000145561	6.974005353
0.000239795	5.748504333
0.000240123	6.32985806
0.000303277	10.7366219
0.000312531	9.502624284];
units.WdJOm   = {'g', 'muL/(d*animal)'};  label.WdJOm = {'dry weight', 'O2 consumption', 'male'};  bibkey.WdJOm = 'Daou1984';
temp.WdJOm   = C2K(10);  units.temp.WdJOm = 'K'; label.temp.WdJOm = 'temperature';
comment.WdJOm = 'respiration measured for males, data from intermediate temperature';

%  Temparature-age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
25.9 11.115401461536678
23.6 11.645496668895078
21.1 12.620277092602393
18.8 15.646280458286256
14.5 22.625694460453204
10.3 37.87708338135963
7.1 62.215818714124325];
units.Tab  = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'RoshMaze1979';
%
data.Tab2 = [ ... % temperature (C), age at birth (d)
10 21.997973862647402
16 15.431250050834175
20 10.550192989130974
25 7.564212377512224
30 5.344556314779684];
units.Tab2  = {'C', 'd'}; label.Tab2 = {'temperature', 'age at birth'};  
bibkey.Tab2 = 'HoldTolb1981';
comment.Tab2 = 'time for development from embryonic stage B to E, basically excluding t0';

%% set weights for all real data
weights = setweights(data, []);
%weights.Wwi = 10 * weights.Wwi; weights.Wwim = 10 * weights.Wwim; 
%weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'Tab', 'Tab2'}; subtitle1 = {'Egg development time, with & without t0'};
set2 = {'WdJO', 'WdJOm'}; subtitle2 = {'Respiation rates, females & males'};
set3 = {'LN', 'LN2'}; subtitle3 = {'Brood size at length'};
metaData.grp.sets = {set1, set2, set3};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};


%% Discussion points
D1 = 'mod_3: temperature effects updated';
D2 = 'Observed incubation time is possibly long because of the coupling between reproduction and moulting';     
D3 = 'Males are assumed to differ from females by {p_Am} only';     
D4 = 'mod_4: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'A. aquaticus is a common species, living in natural surface waters';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'It can eat many different types of food with a huge difference in growth';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Growth and reproduction are temperature dependent, in colder regions typically one brood/year is found, but in warmer climates this can increase up to four broods/year. ';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'H924'; % Cat of Life
metaData.links.id_ITIS = '542579'; % ITIS
metaData.links.id_EoL = '343656'; % Ency of Life
metaData.links.id_Wiki = 'Asellus_aquaticus'; % Wikipedia
metaData.links.id_ADW = 'Asellus_aquaticus'; % ADW
metaData.links.id_Taxo = '34250'; % Taxonomicon
metaData.links.id_WoRMS = '264152'; % WoRMS


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
bibkey = 'Arak2001'; type = 'Article'; bib = [ ... 
'author = {K. S. Arakelova}, ' ... 
'year = {2001}, ' ...
'title = {The evaluation of individual production and scope for growth in aquatic sow bugs (\emph{Asellus aquaticus})}, ' ...
'journal = {Aquatic ecotoxicology}, ' ...
'volume = {35}, ' ...
'pages = {31--42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarcSutc1978'; type = 'Article'; bib = [ ... 
'author = {J. H. Marcus and D. W. Sutcliffe and L. G. Willoughby}, ' ... 
'year = {1978}, ' ...
'title = {Feeding and growth of \emph{Asellus Aquaticus} ({I}sopoda) on food items from the littoral of {W}indermere, including green leaves of \emph{Elodea canadensis}}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {8}, ' ...
'pages = {505--519}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VeroPrev2009'; type = 'Article'; bib = [ ... 
'author = {R. Verovnik and S. Prevorcnik and J. Jugovic}, ' ... 
'year = {2009}, ' ...
'title = {Description of a neotype for \emph{Asellus aquaticus} {L}inne, 1758 ({C}rustacea: {I}sopoda: {A}sellidea), with description of a new subterranean \emph{Asellus} species from {E}urope}, ' ...
'journal = {Zoologische Anzeiger}, ' ...
'volume = {248}, ' ...
'pages = {101--118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HervMath1997'; type = 'Article'; bib = [ ... 
'author = {F. Hervant and J. Mathieu and H. Barre and K. Simon and C. Pinon}, ' ... 
'year = {1997}, ' ...
'title = {Comparative study on the behavioral, ventilatory, and respiratory responses of hypogean and epigean crustaceans to long-term starvation and subsequent feeding.}, ' ...
'journal = {Comp. Biochem. Physiol. A Physiol. }, ' ...
'volume = {118}, ' ...
'pages = {1277-1283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShihHeat1987'; type = 'Article'; bib = [ ... 
'author = {A.F. Shihab and D.J.}, ' ... 
'year = {1987}, ' ...
'title = {Heath Components of fitness and the {P}{G}{I} polymorphism in the freshwater isopod \emph{Asellus aquaticus} (L). 1.  {F}ecundity selection.}, ' ...
'journal = {Heredity}, ' ...
'volume = {58}, ' ...
'pages = {69-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoefVerb2015'; type = 'Article'; bib = [ ... 
'author = {K. N. Hoefnagel and W.C.E.P. Verberk}, ' ... 
'year = {2015}, ' ...
'title = {Is the temperature-size rule mediated by oxygen in aquatic ectotherms?}, ' ...
'journal = {Journal of Thermal Biology}, ' ...
'volume = {54}, ' ...
'pages = {56-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Daou1984'; type = 'PhDThesis'; bib = [ ...  
'author = {Y.T. Daoud}, ' ...
'year = {1984}, ' ...
'title  = {Ecology and bioenergetics of two species of \emph{Asellus} in {R}utland water}, ' ...
'school = {University of Leicester}, ' ...
'pages = {395}, ' ...
'howpublished = {\url{http://hdl.handle.net/2381/34320}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'RoshMaze1979'; type = 'Article'; bib = [ ... 
'author = {V.E. Roshchin and K.L. Mazelev}, ' ... 
'year = {1979}, ' ...
'title = {The influence of constant temperature on the embryonic growth of Asellus aquaticus L. (Crustacea)}, ' ...
'journal = {Vestsi Akad. Navuk BSSR}, ' ...
'volume = {1}, ' ...
'pages = {128-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'HoldTolb1981'; type = 'Article'; bib = [ ... 
'author = {D. M. Holdich and M. R. Tolba}, ' ... 
'year = {1981}, ' ...
'title = {The effect of temperature and water quality on the in vitro development and survival of Asellus aquaticus (Crustacea: Isopoda) eggs}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {78}, ' ...
'pages = {227-236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


